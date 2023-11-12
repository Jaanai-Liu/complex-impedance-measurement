library verilog;
use verilog.vl_types.all;
entity cordic is
    generic(
        angle_0         : integer := 2949120;
        angle_1         : integer := 1740992;
        angle_2         : integer := 919872;
        angle_3         : integer := 466944;
        angle_4         : integer := 234368;
        angle_5         : integer := 117312;
        angle_6         : integer := 58688;
        angle_7         : integer := 29312;
        angle_8         : integer := 14656;
        angle_9         : integer := 7360;
        angle_10        : integer := 3648;
        angle_11        : integer := 1856;
        angle_12        : integer := 896;
        angle_13        : integer := 448;
        angle_14        : integer := 256;
        angle_15        : integer := 128;
        pipeline        : integer := 16;
        K               : integer := 39796
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        x               : in     vl_logic_vector(31 downto 0);
        y               : in     vl_logic_vector(31 downto 0);
        start           : in     vl_logic;
        angle           : out    vl_logic_vector(31 downto 0);
        mozhi           : out    vl_logic_vector(31 downto 0);
        finished        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of angle_0 : constant is 1;
    attribute mti_svvh_generic_type of angle_1 : constant is 1;
    attribute mti_svvh_generic_type of angle_2 : constant is 1;
    attribute mti_svvh_generic_type of angle_3 : constant is 1;
    attribute mti_svvh_generic_type of angle_4 : constant is 1;
    attribute mti_svvh_generic_type of angle_5 : constant is 1;
    attribute mti_svvh_generic_type of angle_6 : constant is 1;
    attribute mti_svvh_generic_type of angle_7 : constant is 1;
    attribute mti_svvh_generic_type of angle_8 : constant is 1;
    attribute mti_svvh_generic_type of angle_9 : constant is 1;
    attribute mti_svvh_generic_type of angle_10 : constant is 1;
    attribute mti_svvh_generic_type of angle_11 : constant is 1;
    attribute mti_svvh_generic_type of angle_12 : constant is 1;
    attribute mti_svvh_generic_type of angle_13 : constant is 1;
    attribute mti_svvh_generic_type of angle_14 : constant is 1;
    attribute mti_svvh_generic_type of angle_15 : constant is 1;
    attribute mti_svvh_generic_type of pipeline : constant is 1;
    attribute mti_svvh_generic_type of K : constant is 1;
end cordic;
