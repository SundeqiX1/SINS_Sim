function glv1 = glvf(Re, f, wie)
% 捷联惯导全局结构变量初始化函数
% 样例: glv = glvf(Re, f, wie)
% 输入: Re - 地球赤道长半轴
%       f - 扁率
%       wie - 地球自转角速度
% 输出: glv1 - 全局变量结构体数组

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月21日

global glv
    if ~exist('Re', 'var'),  Re = [];  end
    if ~exist('f', 'var'),   f = [];  end
    if ~exist('wie', 'var'), wie = [];  end
    if isempty(Re),  Re = 6378137;  end
    if isempty(f),   f = 1/298.257;  end
    if isempty(wie), wie = 7.2921151467e-5;  end
    glv.wie = wie;                  % 地球自转角速度
    glv.Re = Re;                    % 地球赤道长半轴
    glv.f = f;                      % 扁率
    glv.meru = glv.wie/1000;        % 地球自转角速度/1000
    glv.g0 = 9.7803267714;          % 重力加速度g（引力）
    glv.mg = 1.0e-3*glv.g0;         % mg
    glv.ug = 1.0e-6*glv.g0;         % ug
    glv.mGal = 1.0e-3*0.01;         % milli Gal = 1cm/s^2 ~= 1.0E-6*g0
    glv.ugpg2 = glv.ug/glv.g0^2;    % ug/g^2
    glv.ws = 1/sqrt(glv.Re/glv.g0); % 舒勒频率
    glv.ppm = 1.0e-6;               % 百万分之几
    glv.Rp = (1-glv.f)*glv.Re;      % 短半轴
    glv.e = sqrt(2*glv.f-glv.f^2); glv.e2 = glv.e^2; % 第一偏心距
    glv.ep = sqrt(glv.Re^2-glv.Rp^2)/glv.Rp; glv.ep2 = glv.ep^2; % 第二偏心距
    glv.deg = pi/180;               % 弧度
    glv.min = glv.deg/60;           % 弧分
    glv.sec = glv.min/60;           % 弧秒
    glv.hur = 3600;                 % 时间 小时 (1hur=3600second)
    glv.dps = pi/180/1;             % 弧度/秒
    glv.dph = glv.deg/glv.hur;      % 弧度/小时
    glv.dpss = glv.deg/sqrt(1);     % 弧度/sqrt（秒）
    glv.dpsh = glv.deg/sqrt(glv.hur);  % 弧度/sqrt（小时）
    glv.dphpsh = glv.dph/sqrt(glv.hur); % (弧度/小时) / sqrt(小时)
    glv.dph2 = glv.dph/glv.hur;    % （弧度/小时）/小时
    glv.Hz = 1/1;                   % Hz
    glv.dphpsHz = glv.dph/glv.Hz;   % (弧度/小时) / sqrt(Hz)
    glv.dphpg = glv.dph/glv.g0;     % （弧度/小时）/g
    glv.dphpg2 = glv.dphpg/glv.g0;  % （弧度/小时） / g^2
    glv.ugpsHz = glv.ug/sqrt(glv.Hz);  % ug / sqrt(Hz)
    glv.ugpsh = glv.ug/sqrt(glv.hur); % ug / sqrt(小时)
    glv.mpsh = 1/sqrt(glv.hur);     % m / sqrt(小时)
    glv.mpspsh = 1/1/sqrt(glv.hur); % (m/s) / sqrt(小时), 1*mpspsh~=1700*ugpsHz
    glv.ppmpsh = glv.ppm/sqrt(glv.hur); % ppm / sqrt(小时)
    glv.mil = 2*pi/6000;            % mil
    glv.nm = 1853;                  % 海里
    glv.kn = glv.nm/glv.hur;        % 节（速度单位）
    glv.wm_1 = [0,0,0]; glv.vm_1 = [0,0,0];   % 陀螺仪和加速度计初始化
    glv.cs = [                      % 圆锥和划桨误差补偿系数
        [2,    0,    0,    0,    0    ]/3
        [9,    27,   0,    0,    0    ]/20
        [54,   92,   214,  0,    0    ]/105
        [250,  525,  650,  1375, 0    ]/504 
        [2315, 4558, 7296, 7834, 15797]/4620 ];
    glv.csmax = size(glv.cs,1)+1;  % 最大子样本数
    glv.v0 = [0;0;0];    % 3x1 零向量
    glv.qI = [1;0;0;0];  % 单位四元数
    glv.I33 = eye(3); glv.o33 = zeros(3);  % 3x3 单位 & 零 矩阵
    glv.pos0 = [34.246048*glv.deg; 108.909664*glv.deg; 380]; %  导航初始 ‘纬度、经度、高度’ 
    glv.eth = []; glv.eth = earth(glv.pos0);
    [glv.rootpath, glv.datapath, glv.mytestflag] = psinsenvi;
    glv1 = glv;

