//
//  main.m
//  VimAck
//
//  Created by Majd Taby on 5/13/11.
//  Copyright 2011 University of Michigan - Dearborn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
