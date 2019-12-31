
module triangle_pair(x, y, wall_thickness, radius=1) {
    translate([wall_thickness,wall_thickness]) {
        triangle_size =[x-3*wall_thickness, y-3*wall_thickness];

        rounded_triangle(triangle_size.y-wall_thickness, triangle_size.x-wall_thickness,radius);
        translate([triangle_size.x+wall_thickness,triangle_size.y+wall_thickness])
            rotate([0,0,180])
                rounded_triangle(triangle_size.y-wall_thickness, triangle_size.x-wall_thickness,radius);
    }
}

module rounded_triangle(height, width, radius) {
    r=radius;
    hull() {
        translate([r,r])
            circle(r=radius);
        translate([0+r,height-r])
            circle(r=radius);
        translate([width-r,0+r])
            circle(r=radius);
    }
}

module triangle_base_cut(base_size, x_divisions, y_divisions, wall_thickness=2, radius=1, center=false) {
    translate(center ? -[base_size.x/2,base_size.y/2,0] :[0,0,0])
    for(j=[0:y_divisions-1]) {
        for(i=[0:x_divisions-1]) 
        {
            triangle_pair(base_size.x/x_divisions,base_size.y / y_divisions, wall_thickness, radius);
            translate([i*base_size.x/x_divisions,j*base_size.y / y_divisions])
                triangle_pair(base_size.x/x_divisions,base_size.y / y_divisions, wall_thickness, radius);
        }
    }
}
