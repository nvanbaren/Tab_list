module.exports = function(grunt) {
  'use strict';
	var markdown = require('markdown').markdown,
	PDFDocument  = require('pdfkit'),
	fs           = require('fs'),
	styles,
  renderPDF,
	renderPDFDocument
	;
	
	renderPDF = (function(){
	  var level, member;
		function renderPDF(markdownTree){
			/*Init*/
			var code, _ref;
			level = 0;
			if (typeof markdownTree === 'string') {
				this.type = 'text';
				this.text = markdownTree;
				return;
			}
			this.type = markdownTree.shift();
			this.attrs = {};
			if (typeof markdownTree[0] === 'object' && !Array.isArray(markdownTree[0])) {
				this.attrs = markdownTree.shift();
			}
			this.content = (function() {
				var _results;
				_results = [];
				if (markdownTree == 'undefined') {
				  grunt.fail.warn('markdownTree undefined');
				} else {
					while (markdownTree.length) {
						_results.push(new renderPDF(markdownTree.shift()));
					}
				}
				return _results;
			})();
			
			if (this.type == 'header') {
				this.style = styles['h' + this.attrs.level]||styles.para;
			} else {
				this.style = styles[this.type] || styles.para;
			}		
		};
		renderPDF.prototype.renderBlock = function(doc,parentType) {
			var _ref, index,_i,_len,options,fragment,next_fragment,bulletStyle,_original_x,_original_y,_textWidth;

			switch (this.type) {
				case 'hr':
				  grunt.log.writeln('Blok line');
					break;
				case 'para':
					this.renderText(doc,true,true);
					break;
				case 'header':
				  this.renderText(doc,true,true);
					break;
				case 'blockcode':
				 	options = this.setStyle(doc);
					options.continued = false;
					fragment = this.content[0];
					doc.text(this.text,options);
					break;
				case 'bulletlist':
          level = level+1;
          this.renderContainerBlock(doc);
          break;					
        case 'listitem':
				  /*Draw bullet*/
					_original_x = doc.x;					
					if (parentType == 'bulletlist') {
					  doc.x = _original_x + 10;
						if (this.style.bullet) {
							bulletStyle = this.style.bullet[level];
							switch ( bulletStyle) {
								case 'square':
									doc.rect(doc.x - 5, doc.y+3,2,2).fill();
									break;
								case 'dash':
									doc.rect(doc.x - 5, doc.y+3,2,1).fill();
									break;
								default:
									doc.circle(doc.x - 5, doc.y+3, 1).fill();
							}
						} else {
							doc.circle(doc.x - 5, doc.y+3, 1).fill();
						}
					} else if(parentType == 'numberlist' ){
					  _textWidth = doc.widthOfString(member+'. ');
						options = this.setStyle(doc);
						options.continued = true;
						options.indent = -Math.round((_textWidth+2));						
						doc.x = _original_x + 30;
						doc.text(member+'. ',options);
					}
          this.renderContainerBlock(doc);
					doc.x = _original_x;
          break;
				case 'numberlist':
				  level = level+1;
          this.renderContainerBlock(doc);
          break;					
        case 'blockquote':
				  _original_x = doc.x;
					_original_y = doc.y;
					doc.x = doc.x + 10;
 				  this.renderContainerBlock(doc);
					doc.x = _original_x;
					doc.rect(_original_x,_original_y,2,doc.y-_original_y).fill('gray');
          break;
				default:
					this.renderText(doc,true,true);
			}
		};
		
		renderPDF.prototype.renderContainerBlock = function(doc){
		  var _ref,_len,_i,options,fragment,next_fragment;
		  _ref = this.content;
			if (_ref == undefined) {
				grunt.fail.warn('type '+this.type+' no content');
			} else {
				_len = _ref.length;
				options = this.setStyle(doc);
				for (_i = 0; _i < _len;_i++) {
					fragment = _ref[_i];
					member = _i+1;
					if (!(_i==(_len-1))) {
						next_fragment =_ref[_i+1];
					}
					if (fragment.type == 'text') {
						options = this.setStyle(doc);
						if (next_fragment && next_fragment.isBlock()) {
							options.continued = false;
						} else {
							options.continued = !(_i==(_len-1));
						}
						doc.text(fragment.text.replace(/[\r\n]\s*/g,' '),options);
					} else if(fragment.isInline()){
						fragment.renderText(doc,false,(_i==(_len-1)));
					} else {
					  fragment.renderBlock(doc,this.type);
					}
				}
			}
		};
		
		renderPDF.prototype.renderText = function(doc,parentBlock,last){
			var _ref,
					_i,
					_len,
					_text,
					options,
					fragment;
			_ref = this.content;
			if ( _ref == undefined ) {
				-len = 0;	
			} else {				
				_len = _ref.length;
				options = this.setStyle(doc);
 			
				for (_i = 0; _i < _len;_i++) {
					fragment = _ref[_i];
					switch (fragment.type) {
						case 'linebreak':
							options.continued = false;
							doc.moveDown();
							doc.text('');
							break;
						case 'text':
							options = this.setStyle(doc);						
							if(parentBlock === true) {
								if (_i == (_len-1)) {
									options.continued = false;
								} else {
									options.continued = true;
								}							
							} else {
								options.continued = !last;
							}
							if (this.type == 'code'){
							  _text = fragment.text;
							} else {
							  _text = fragment.text.replace(/[\r\n]\s*/g, ' ');
							}
							doc.text(_text,options);
							break;
            						
						default:
							if (parentBlock) {							  
								fragment.renderText(doc,false,(_i == (_len-1)));
							} else {
							  fragment.renderText(doc,false,false);
							}
					}
				}
			}
		};
		renderPDF.prototype.setStyle = function(doc) {
			var options;		
			if (this.style.font) {
				doc.font(this.style.font);
			}
			if (this.style.fontSize) {
				doc.fontSize(this.style.fontSize);
			}
			if (this.style.color || this.attrs.color) {
				doc.fillColor(this.style.color || this.attrs.color);
			} else {
				doc.fillColor('black');
			}
			options = {};
			options.align = this.style.align;
			options.link = this.attrs.href || false;
			if (this.attrs.continued != null) {
				options.continued = this.attrs.continued;
			}
			return options;
		};
		
		renderPDF.prototype.isBlock = function(){
		  var _result,_blocks,_numberBlocks,_i;
			_blocks = ['bulletlist','listitem','blockquote','para','header','blockcode'];
			_numberBlocks = _blocks.length;
		  for (_i =0;_i<_numberBlocks;_i++) {
			  if( this.type == _blocks[_i]) {
				  _result = true;
				}
			}
			if (_result == null) {
			  _result = false;
			}
			return _result;
		};
		
		renderPDF.prototype.isInline = function(){
		  var _result,_inlines,_numberInlines,_i;
			_inlines = ['em','strong','code','link'];
			_numberInlines = _inlines.length;
		  for (_i =0; _i < _numberInlines; _i++) {
			  if( this.type == _inlines[_i]) {
				  _result = true;
				}
			}
			if (_result == null) {
			  _result = false;
			}
			return _result;
		};
		
		return renderPDF;
	})();
	

	
	renderPDFDocument = function(filesSrc,destFile,done) {
		var node,
    		tree, 
				_results,
				doc,
				stream,
				counter = 0,
				options,
				setTitleOptions;
		
		setTitleOptions = function() {
			var options,titleStyle;
			titleStyle = styles['title'];
			if (titleStyle.font) {
					doc.font(titleStyle.font);
				}
				if (titleStyle.fontSize) {
					doc.fontSize(titleStyle.fontSize);
				}
				if (titleStyle.color) {
					doc.fillColor(titleStyle.color);
				} else {
					doc.fillColor('black');
				}
				options = {};
				options.align = titleStyle.align;
				options.continued = false;
			return options;
		};
	
		doc = new PDFDocument;
		doc.on('finish',function(){
			grunt.verbose.writeln('PDF document is finished');
			stream.end();
		});
		doc.on('error',function(error){
			stream.end();
			done('error');
			grunt.fail.warn(error);
		});
		
		stream = fs.createWriteStream(destFile);
		
		stream.on('error',function(error){
			grunt.fail.warn(error);
		});

		stream.on('finish',function(){
		  done('success');
			grunt.verbose.writeln('PDF '+destFile+' is created');
		});
		
		/*The actual creating of the pdf file*/
		doc.pipe(stream);
		filesSrc.forEach(function(file) {
			var title = file.match(/\/([^/]*)$/)[1]; 
			title = title.substr(0, title.lastIndexOf('.'));
			grunt.verbose.writeln('Render file: '+file);
			counter++;
			if (counter>1) {
				doc.addPage();
			}	
			options = setTitleOptions();
			doc.text(title,options);			
			tree = markdown.parse(fs.readFileSync(file, 'utf8'));
			tree.shift();
			_results = [];
			if (tree == 'undefined') {
				grunt.fail.warn('tree undefined');
			} else {
				while (tree.length) {
					node = new renderPDF(tree.shift());
					_results.push(node.renderBlock(doc));
				}
			}
		});
		doc.end();			
		return _results;
	};
		
  grunt.registerMultiTask('pdfgenerator','Create pdf file',function(){
	  var options,
		    done
				;
		
		done = this.async();
		options = this.options({
			styleFile:"Build/style.json"
		});
		
		styles =  grunt.file.readJSON(options.styleFile);
		renderPDFDocument(this.filesSrc,this.file.dest,done);
	});
};