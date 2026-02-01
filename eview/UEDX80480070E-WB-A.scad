BaseLength = 122;
BaseDepth = 76;
BaseHeight = 12;
module mount_plate() {
  difference() {
    cube([BaseLength+4,BaseDepth+4,BaseHeight]);
    translate([2,2,2])
      cube([BaseLength,BaseDepth,BaseHeight]);
    // holes for panel mount
    translate([5,5,-1])
      cylinder(4,2,2);
    translate([5,BaseDepth-1,-1])
      cylinder(4,2,2);
    translate([BaseLength-1,5,-1])
      cylinder(4,2,2);
    translate([BaseLength-1,BaseDepth-1,-1])
      cylinder(4,2,2);
  }  
}

module port_holes() {
  UsbOffsetX=20;
  UsbLength=20;
  UsbPortGap=5;
  // usb c
  translate([UsbOffsetX,-1,5])
    color("#ff0000")
    cube([UsbLength,4,8]);
  translate([UsbOffsetX+UsbLength+UsbPortGap,-1,5])
    color("#ff0000")
    cube([UsbLength,4,8]);
  // sdcard
  translate([BaseLength+1,BaseDepth-35,5])
    color("#ff0000")
    cube([4,30,8]);
}



difference() {
  mount_plate();
  port_holes();

  // version
  translate([BaseLength/2,BaseDepth/2,-1])
    color("#ff0000")
    linear_extrude(2)
    rotate([0,180,0])
    text("1", size=20);
}
