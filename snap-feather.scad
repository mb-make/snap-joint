
material_z = 3;
nothing = 0.01;

module snap_feather(
            width,
            height,
            hook_width,
            hook_height,
            hook_cutaway,
            leg_width,
            leg_count,
            leg_offset
            )
{
    // feather leg(s)
    difference()
    {
        translate([
            width/2,
            height/2,
            0
            ])
        cube([
            width,
            height,
            material_z
            ], center=true);
        
        leg_width = width/(2*leg_count-1);
        leg_height = height - hook_height - leg_offset;
        for (i=[1:leg_count-1])
        {
            translate([
                leg_width/2 + (i*2-1)*leg_width,
                leg_height/2 + leg_offset,
                0
                ])
            cube([
                leg_width,
                leg_height,
                material_z + 2*nothing
                ], center=true);
        }
    }

    // feather head
    translate([
        width + hook_width/2,
        height - hook_height/2,
        0
        ])
    difference()
    {
        cube([
            hook_width,
            hook_height,
            material_z
            ], center=true);
        
        // cut away a corner
        translate([
            hook_width/2,
            hook_height/2,
            0
            ])
        rotate(45)
        cube([
            hook_cutaway,
            hook_cutaway,
            material_z + 2*nothing
            ], center=true);
    }
}

snap_feather(
    width=5,
    height=40,
    hook_width=3,
    hook_height=5,
    hook_cutaway=4,
    leg_width=2,
    leg_count=3,
    leg_offset=3
    );
