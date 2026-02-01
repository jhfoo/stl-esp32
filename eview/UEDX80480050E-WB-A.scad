BaseLength = 137;
BaseDepth = 84;
BaseHeight = 14;
BoardVersion = "6";

TopHeight = 6;
PanelLength = 123;
PanelWidth = 78;

module base_frame() {
  difference() {
    cube([BaseLength+4,BaseDepth+4,BaseHeight]);
    translate([2,2,2])
      cube([BaseLength,BaseDepth,BaseHeight]);
    // holes for panel mount
    translate([6,6,-1])
      cylinder(4,2,2);
    translate([6,BaseDepth-2,-1])
      cylinder(4,2,2);
    translate([BaseLength-1,6,-1])
      cylinder(5,2,2);
    translate([BaseLength-1,BaseDepth-2,-1])
      cylinder(5,2,2);
  }  
}

module port_holes() {
  UsbOffsetX=45;
  UsbLength=15;
  UsbPortGap=4;
  // usb c
  translate([UsbOffsetX,-1,5])
    color("#ff0000")
    cube([UsbLength,4,10]);
  translate([UsbOffsetX+UsbLength+UsbPortGap,-1,5])
    color("#ff0000")
    cube([UsbLength,4,10]);
  // sdcard
  translate([BaseLength+1,BaseDepth-22,5])
    color("#ff0000")
    cube([4,18,10]);
}

module base_final() {
  translate([0,100,0])
    difference() {
      base_frame();
      port_holes();

      // version
      translate([BaseLength/2,BaseDepth/2,-1])
        color("#ff0000")
        linear_extrude(2)
        rotate([0,180,0])
        text(BoardVersion, size=20);
    }
}

module top_frame() {
  difference() {
    cube([BaseLength+4,BaseDepth+4,TopHeight]);
    translate([2,2,2])
      cube([BaseLength,BaseDepth,TopHeight]);
    translate([9, 4,1])
      cube([PanelLength, PanelWidth,3]);
    translate([13, 6,-1])
      cube([PanelLength-8, PanelWidth-8,3]);
  }  
}



module top_final() {
  top_frame();
  translate([-2,-2,0])
    difference() {
      cube([20,20,BaseHeight+TopHeight]);
      translate([2,2,-1])
        cube([20,20,BaseHeight+TopHeight+2]);    
      translate([12,1,14])
        color("#ff0000")
        rotate([90,180,0])
        linear_extrude(5)
        text(BoardVersion,8);
    }
  translate([BaseLength-14,BaseDepth-14,0])
    difference() {
      cube([20,20,BaseHeight+TopHeight]);
      translate([-2,-2,-1])
        cube([20,20,BaseHeight+TopHeight+2]);    
    }
}


//base_final();
top_final();