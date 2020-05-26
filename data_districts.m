%COVID-19 Nigeria districts data

%% Lagos Mainland General Population

%number of residents aged 0-14: 79320
%number of residents aged 15-59: 175055
%number of residents aged 60+: 13895

%number of female residents aged 0-14: 40977
%number of female residents aged 15-59: 78335  %%%female aged 15-49 are 81559 which makes them 89% of the 15-59 age group
%number of female residents aged 60+: 8347

%number of male residents aged 0-14: 38325
%number of male residents aged 15-59: 96720
%number of male residents aged 60+: 5548

%(S E Iu Ia Is Ih Ru Rh D Nc)
y0_mainland=[79320-0 0 0 0 0 0 0 0 0 0 175055-41 24 10 4 2 1 0 0 0 1 13895-6 3 0 1 1 1 0 0 0 0 1];

%data on cumulative notified cases 
data_mainland=[2	2	2	2	4	4	5	5	5	6	8	8	11	12	14	18	20	23	31	42	45	47	53	59	63	69	71	77	86	92	106	122	136	157	180	210	255	285	308	343	396	410	445	467	488	525	546	574	582	603	628	641	654	687	689];

days=0:1:length(data_mainland)-1;
% days=0:1:28;
% data_mainland = data_mainland(1:29);

%deaths
deaths_mainland=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	1	0	0	0	0	0	0	0	1	2	1	0	0	0	0	1	0	1	1	1	0	0	0	0	0	0];

for i=2:length(deaths_mainland)
    deaths_mainland_cumul(1)=deaths_mainland(1);
    deaths_mainland_cumul(i)=deaths_mainland_cumul(i-1)+deaths_mainland(i);
end
days2=0:1:length(deaths_mainland)-1;

% days2=0:1:28;
% deaths_mainland_cumul = deaths_mainland_cumul(1:29);


%% Mushin General Population


%number of residents aged 0-14: 105971
%number of residents aged 15-59: 229486
%number of residents aged 60+: 16932

%number of female residents aged 0-14: 54400
%number of female residents aged 15-59: 104041  %%%female aged 15-49 are 81559 which makes them 89% of the 15-59 age group
%number of female residents aged 60+: 9847

%number of male residents aged 0-14: 51571
%number of male residents aged 15-59: 125445
%number of male residents aged 60+: 7085

%(S E Iu Ia Is Ih Ru Rh D Nc)
y0_mushin=[105971 0 0 0 0 0 0 0 0 0 229486-3 0 0 1 1 1 0 0 0 0 1 16932-0 0 0 0 0 0 0 0 0 0];


%data on cumulative notified cases 
data_mushin=[0	1	1	1	1	1	1	1	1	2	2	2	2	3	3	3	3	3	3	3	3	3	3	3	3	3	3	4	4	4	5	6	8	23	26	37	41	46	55	56	58	64	69	72	73	80	80	99	101	113	130	142	170	190	190];

days=0:1:length(data_mushin)-1;
% days=0:1:28;
% data_mushin = data_mushin(1:29);

%deaths
deaths_mushin=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	0	0	0];

for i=2:length(deaths_mushin)
    deaths_mushin_cumul(1)=deaths_mushin(1);
    deaths_mushin_cumul(i)=deaths_mushin_cumul(i-1)+deaths_mushin(i);
end
days2=0:1:length(deaths_mushin)-1;

% days2=0:1:28;
% deaths_mushin_cumul = deaths_mushin_cumul(1:29);


%% Alimosho General Population


%number of residents aged 0-14: 722522
%number of residents aged 15-59: 1286802
%number of residents aged 60+: 70262

%number of female residents aged 0-14: 369085
%number of female residents aged 15-59: 597548  %%%female aged 15-49 are 81559 which makes them 89% of the 15-59 age group
%number of female residents aged 60+: 38658

%number of male residents aged 0-14: 353437
%number of male residents aged 15-59: 689254
%number of male residents aged 60+: 31604

%(S E Iu Ia Is Ih Ru Rh D Nc)
y0_alimosho=[722522 0 0 0 0 0 0 0 0 0 1286802 0 0 0 0 0 0 0 0 0 70262 0 0 0 0 0 0 0 0 0];


%data on cumulative notified cases 
data_alimosho=[0	0	0	0	0	0	0	0	0	1	1	1	1	2	2	4	4	5	7	7	7	8	8	8	8	8	8	13	19	19	21	26	29	30	40	50	53	55	56	72	73	73	78	80	80	80	80	80	80	80	80	80	80	80	81];

days=0:1:length(data_alimosho)-1;
% days=0:1:28;
% data_alimosho = data_alimosho(1:29);

%deaths
deaths_alimosho=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0];

for i=2:length(deaths_alimosho)
    deaths_alimosho_cumul(1)=deaths_alimosho(1);
    deaths_alimosho_cumul(i)=deaths_alimosho_cumul(i-1)+deaths_alimosho(i);
end
days2=0:1:length(deaths_alimosho)-1;

% days2=0:1:28;
% deaths_alimosho_cumul = deaths_alimosho_cumul(1:29);




%% Whole Country

data=[3	7	7	7	9	10	13	15	15	20	32	32	39	44	57	67	71	75	88	99	102	106	112	123	129	135	140	159	181	189	217	255	292	360	422	502	623	713	763	879	967	990	1064	1105	1128	1174	1196	1245	1256	1292	1336	1362	1404	1457	1460];

days=0:1:length(data)-1;
% days=0:1:28;
% data = data(1:29);

deaths=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	1	0	1	1	0	2	0	0	0	1	0	3	1	1	2	1	1	1	1	0	2	0	2	1	1	0	0	0	0	0	0];

for i=2:length(deaths)
    deaths_cumul(1)=deaths(1);
    deaths_cumul(i)=deaths_cumul(i-1)+deaths(i);
end
days2=0:1:length(deaths)-1;

% days2=0:1:28;
% deaths_cumul = deaths_cumul(1:29);

%% Rest of Lagos General Population

%number of residents aged 0-14: 989852
%number of residents aged 15-59: 2098366
%number of residents aged 60+: 129466

%number of female residents aged 0-14: 507423
%number of female residents aged 15-59: 933610  %%%female aged 15-49 are 81559 which makes them 89% of the 15-59 age group
%number of female residents aged 60+: 71860

%number of male residents aged 0-14: 482447
%number of male residents aged 15-59: 1164756
%number of male residents aged 60+: 57606

%(S E Iu Ia Is Ih Ru Rh D Nc)
y0_rest=[989852 0 0 0 0 0 0 0 0 0 2098366-13 6 0 2 0 1 0 0 0 1 129466-13 6 2 4 1 0 0 0 0 0];

%data
data_rest=data-data_mainland-data_mushin-data_alimosho;

days=0:1:length(data_rest)-1;
% days=0:1:28;
% data = data(1:29);

%deaths
deaths=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	1	0	1	1	0	2	0	0	0	1	0	3	1	1	2	1	1	1	1	0	2	0	2	1	1	0	0	0	0	0	0];
deaths_rest=deaths-deaths_mainland-deaths_mushin-deaths_alimosho;

for i=2:length(deaths_rest)
    deaths_rest_cumul(1)=deaths_rest(1);
    deaths_rest_cumul(i)=deaths_rest_cumul(i-1)+deaths_rest(i);
end
days2=0:1:length(deaths_rest)-1;

% days2=0:1:28;
% deaths_rest_cumul = deaths_rest_cumul(1:29);