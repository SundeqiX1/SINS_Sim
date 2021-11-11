function glv1 = glvf(Re, f, wie)
% �����ߵ�ȫ�ֽṹ������ʼ������
% ����: glv = glvf(Re, f, wie)
% ����: Re - ������������
%       f - ����
%       wie - ������ת���ٶ�
% ���: glv1 - ȫ�ֱ����ṹ������

% �ο����ϣ��Ϲ������ڣ�����������������ҵ��ѧ��PSIN�����������ؽ̲�
% �޸ģ�����棬�������ݣ��й���ҵ��ѧ����ɽ���ܲɾ�װ��ʵ����
% ��һ�棺2021��8��21��

global glv
    if ~exist('Re', 'var'),  Re = [];  end
    if ~exist('f', 'var'),   f = [];  end
    if ~exist('wie', 'var'), wie = [];  end
    if isempty(Re),  Re = 6378137;  end
    if isempty(f),   f = 1/298.257;  end
    if isempty(wie), wie = 7.2921151467e-5;  end
    glv.wie = wie;                  % ������ת���ٶ�
    glv.Re = Re;                    % ������������
    glv.f = f;                      % ����
    glv.meru = glv.wie/1000;        % ������ת���ٶ�/1000
    glv.g0 = 9.7803267714;          % �������ٶ�g��������
    glv.mg = 1.0e-3*glv.g0;         % mg
    glv.ug = 1.0e-6*glv.g0;         % ug
    glv.mGal = 1.0e-3*0.01;         % milli Gal = 1cm/s^2 ~= 1.0E-6*g0
    glv.ugpg2 = glv.ug/glv.g0^2;    % ug/g^2
    glv.ws = 1/sqrt(glv.Re/glv.g0); % ����Ƶ��
    glv.ppm = 1.0e-6;               % �����֮��
    glv.Rp = (1-glv.f)*glv.Re;      % �̰���
    glv.e = sqrt(2*glv.f-glv.f^2); glv.e2 = glv.e^2; % ��һƫ�ľ�
    glv.ep = sqrt(glv.Re^2-glv.Rp^2)/glv.Rp; glv.ep2 = glv.ep^2; % �ڶ�ƫ�ľ�
    glv.deg = pi/180;               % ����
    glv.min = glv.deg/60;           % ����
    glv.sec = glv.min/60;           % ����
    glv.hur = 3600;                 % ʱ�� Сʱ (1hur=3600second)
    glv.dps = pi/180/1;             % ����/��
    glv.dph = glv.deg/glv.hur;      % ����/Сʱ
    glv.dpss = glv.deg/sqrt(1);     % ����/sqrt���룩
    glv.dpsh = glv.deg/sqrt(glv.hur);  % ����/sqrt��Сʱ��
    glv.dphpsh = glv.dph/sqrt(glv.hur); % (����/Сʱ) / sqrt(Сʱ)
    glv.dph2 = glv.dph/glv.hur;    % ������/Сʱ��/Сʱ
    glv.Hz = 1/1;                   % Hz
    glv.dphpsHz = glv.dph/glv.Hz;   % (����/Сʱ) / sqrt(Hz)
    glv.dphpg = glv.dph/glv.g0;     % ������/Сʱ��/g
    glv.dphpg2 = glv.dphpg/glv.g0;  % ������/Сʱ�� / g^2
    glv.ugpsHz = glv.ug/sqrt(glv.Hz);  % ug / sqrt(Hz)
    glv.ugpsh = glv.ug/sqrt(glv.hur); % ug / sqrt(Сʱ)
    glv.mpsh = 1/sqrt(glv.hur);     % m / sqrt(Сʱ)
    glv.mpspsh = 1/1/sqrt(glv.hur); % (m/s) / sqrt(Сʱ), 1*mpspsh~=1700*ugpsHz
    glv.ppmpsh = glv.ppm/sqrt(glv.hur); % ppm / sqrt(Сʱ)
    glv.mil = 2*pi/6000;            % mil
    glv.nm = 1853;                  % ����
    glv.kn = glv.nm/glv.hur;        % �ڣ��ٶȵ�λ��
    glv.wm_1 = [0,0,0]; glv.vm_1 = [0,0,0];   % �����Ǻͼ��ٶȼƳ�ʼ��
    glv.cs = [                      % Բ׶�ͻ�������ϵ��
        [2,    0,    0,    0,    0    ]/3
        [9,    27,   0,    0,    0    ]/20
        [54,   92,   214,  0,    0    ]/105
        [250,  525,  650,  1375, 0    ]/504 
        [2315, 4558, 7296, 7834, 15797]/4620 ];
    glv.csmax = size(glv.cs,1)+1;  % �����������
    glv.v0 = [0;0;0];    % 3x1 ������
    glv.qI = [1;0;0;0];  % ��λ��Ԫ��
    glv.I33 = eye(3); glv.o33 = zeros(3);  % 3x3 ��λ & �� ����
    glv.pos0 = [34.246048*glv.deg; 108.909664*glv.deg; 380]; %  ������ʼ ��γ�ȡ����ȡ��߶ȡ� 
    glv.eth = []; glv.eth = earth(glv.pos0);
    [glv.rootpath, glv.datapath, glv.mytestflag] = psinsenvi;
    glv1 = glv;

