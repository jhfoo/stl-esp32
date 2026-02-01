$fn=50;
box_height = 8;
box_length = 89;
box_width = 65;
top_height = 11;
wall_ext_thickness = 2;
model_version = "7";

module base() {
  difference() {
    cube([box_length+wall_ext_thickness*2, 
      box_width+wall_ext_thickness*2,box_height]);
    translate([wall_ext_thickness,wall_ext_thickness,2])
      cube([box_length, box_width, box_height]);
  }
}

module base_top() {
  difference() {
    cube([box_length+wall_ext_thickness*2, 
      box_width+wall_ext_thickness*2,top_height]);
    translate([wall_ext_thickness,wall_ext_thickness,1])
      cube([box_length, box_width, top_height]);
  }
}

module holes_spacers() {
  radius = 2;
  
  // hole bottom left
  translate([wall_ext_thickness+3, 
    wall_ext_thickness+3, 
    -1])
    cylinder(box_height, 2,2);

  // hole top left
  translate([wall_ext_thickness+3, 
    box_width-1, 
    -1])
    cylinder(box_height, 2,2);

  // hole bottom right
  translate([box_length-wall_ext_thickness+1, 
    wall_ext_thickness+3, 
    -1])
    cylinder(box_height, 2,2);

  // hole top right
  translate([box_length-wall_ext_thickness+1, 
    box_width-1, 
    -1])
    cylinder(box_height, 2,2);
}

module holes_ports() {
  // sdcard 
  translate([box_length+wall_ext_thickness-2,24, -1])
    color("#ff0000")
    cube([wall_ext_thickness+5,16,box_height+5]);

    // microusb
  translate([box_length+wall_ext_thickness-1,8, 2+3])
    color("#ff0000")
    cube([wall_ext_thickness+2,32,box_height]);
}

module VersionNum() {
  translate([box_length/2,box_width/2,3])
    rotate([0,180,0])
    linear_extrude(4)
    text(model_version, size=10);
}

module VersionNumTop() {
  translate([box_length/2,3,8])
    rotate([90,180,0])
    linear_extrude(4)
    text(model_version, size=6);
}

module box_top() {
  difference() {
    base_top();
    translate([2,8,-1])
      cube([box_length-8, box_width-12, top_height+2]);
    // usb and sdcard
    translate([-1,8,5])
      color("#ff0000")
      cube([4, 32, 10]);
    VersionNumTop();
  }
  translate([9,2,0])
    cube([2, box_width, 5]);
  translate([9,2,0])
    cube([4, box_width, 1]);
  translate([2,47,0])
    cube([10, 15, 1]);

}

module ClipHoles() {
  ClipGap = 60;
  ClipHeight = 30;
  translate([(box_length-ClipGap)/2,20,-1])
    color("#ff0000")
    cube([2,ClipHeight, 4]);
  translate([(box_length-ClipGap)/2+ClipGap,20,-1])
    color("#ff0000")
    cube([2,ClipHeight, 4]);
}

difference() {
  base();
  holes_spacers();
  holes_ports();
  ClipHoles();
  VersionNum();
}

translate([0,box_width + 20,0])
  box_top();
