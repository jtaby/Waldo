#
#  AckTableViewController.rb
#  VimAck
#
#  Created by Majd Taby on 5/28/11.
#  Copyright 2011 University of Michigan - Dearborn. All rights reserved.
#

class AckTableViewController
    attr_accessor :table_view, :records, :projectRoot
    
    def initialize
        @records = {}
    end
    
    ## NSTableDataSource methods
    
    def outlineView(outlineView, numberOfChildrenOfItem:item)
        return (item == nil) ? @records.length : item.records.length;
    end
    
    def outlineView(outlineView, isItemExpandable:item)
        return (item.instance_of? MatchedFile) ? true : false;
    end
    
    def outlineView(outlineView, child:index, ofItem:item)
        if item == nil
            @records[index]
        else
            ret = item.records[index]
            ret
        end
    end 
    
    def outlineView(outlineView, objectValueForTableColumn:tableColumn, byItem:item)
        if item.instance_of? MatchedFile
            
            path = File.path item.filename
            separater = " - "
            base = File.basename item.filename
            
            styledString = NSMutableAttributedString.alloc.initWithString "#{base}#{separater}#{path}"
            
            styledString.addAttribute(NSFontAttributeName,
                                      value: NSFont.systemFontOfSize(11),
                                      range: [0,styledString.length])
            
        else
            styledString = NSMutableAttributedString.alloc.initWithString item.matched_line
            
            
            styledString.addAttribute(NSForegroundColorAttributeName,
                                      value: NSColor.grayColor,
                                      range: [0,styledString.length])
            
            item.matched_ranges.each do |range|
                
                styledString.addAttribute(NSFontAttributeName,
                                          value: NSFont.systemFontOfSize(11),
                                          range: [0,styledString.length])
                
                styledString.addAttribute(NSFontAttributeName,
                                          value: NSFont.boldSystemFontOfSize(11),
                                          range:[range,item.query.length])
                
                styledString.addAttribute(NSForegroundColorAttributeName,
                                          value: NSColor.blackColor,
                                          range:[range,item.query.length])
            end
            
        end
        
        styledString
    end
    
    def outlineView(outlineView, willDisplayCell:cell, forTableColumn:tableColumn, item:item)
        cell.setRepresentedObject(item)
    end
    
    def tableView(tableView, willDisplayCell:cell, forTableColumn:column, row:row)
        cell.setRepresentedObject(@records[row])
    end
    
    def outlineViewSelectionDidChange(notification)
        rowNumber = notification.object.selectedRow
        item = notification.object.itemAtRow(rowNumber)
        
        fullPath = "#{@projectRoot}/#{item.filename}"
		lineNumber = item.line_number
		columnNumber = item.matched_ranges[0] + 1
		
		urlString = "mvim://open?url=file://#{fullPath}&line=#{lineNumber}&column=#{columnNumber}"
		puts urlString
		url = NSURL.URLWithString(urlString)
		
		NSWorkspace.sharedWorkspace.openURL(url)
    end
        
end