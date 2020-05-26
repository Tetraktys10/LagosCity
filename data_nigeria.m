%COVID-19 Nigera data

%% General Population

%data=[3	7	7	7	9	10	12	14	14	19	29	29	35	38	51	58	62	66	78	88	90	94	101	112	118	123	128	144	161	168	189	221	256	293	324	335	346]; %data on cumulative notified cases 
data=[4	8	8	8	10	11	14	16	16	21	33	33	39	43	56	65	69	73	86	97	99	103	109	120	126	131	136	154	175	183	211	248	284	350	410	484	598	687	713	768	815	824	840	877	892	913	934	972	976	997	1003];

days=0:1:length(data)-1;
% days=0:1:37;
% data = data(1:38);

%deaths=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	1	0	1	1	0	2	0	0	0	1	0	0	0];
deaths=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	1	0	1	1	0	2	0	0	0	1	0	3	1	1	1	1	1	1	1	0	2	0	2	0	1	0	0];

for i=2:length(deaths)
    deaths_cumul(1)=deaths(1);
    deaths_cumul(i)=deaths_cumul(i-1)+deaths(i);
end
days2=0:1:length(deaths)-1;

% days2=0:1:37;
% deaths_cumul = deaths_cumul(1:38);

%% Population disaggregated by age and sex

%cases
new_014_m=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	1	0	0	0	0	3	1	3	1	2	0	0	0	0	0	1	0	0	0	0	0	0	0];
new_1559_m=[2	1	0	0	2	0	2	1	0	1	5	0	4	2	2	5	2	2	6	4	1	0	2	7	4	3	3	6	8	1	15	20	11	34	39	35	61	47	17	27	16	6	12	24	8	12	7	21	4	14	5];
new_60plus_m=[1	0	0	0	0	1	0	1	0	0	1	0	0	0	0	0	0	1	0	0	0	1	0	2	0	0	0	2	1	0	1	5	2	3	2	3	7	6	1	3	3	0	0	0	1	0	0	2	0	1	0];

new_014_f=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	2	2	3	3	3	0	1	1	0	0	0	0	0	0	0	0	0	0];
new_1559_f=[1	3	0	0	0	0	1	0	0	1	1	0	2	1	0	4	1	0	1	1	0	2	1	1	2	2	1	5	8	6	5	9	19	19	12	25	35	27	4	17	11	3	3	5	6	7	13	6	0	3	1];
new_60plus_f=[0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	1	1	2	3	0	4	1	1	0	4	0	0	1	0	0	1	0	1	0	1	0];

new_unknown=[0	0	0	0	0	0	0	0	0	3	5	0	0	0	11	0	1	1	6	6	1	1	3	1	0	0	0	2	3	0	6	2	2	2	4	1	6	2	4	3	16	0	0	7	0	1	1	8	0	2	0];

for i=2:length(new_014_m)
    new_014_m_cumul(1)=new_014_m(1);
    new_014_m_cumul(i)=new_014_m_cumul(i-1)+new_014_m(i);
    
    new_1559_m_cumul(1)=new_1559_m(1);
    new_1559_m_cumul(i)=new_1559_m_cumul(i-1)+new_1559_m(i);
    
    new_60plus_m_cumul(1)=new_60plus_m(1);
    new_60plus_m_cumul(i)=new_60plus_m_cumul(i-1)+new_60plus_m(i);
    
    
    new_014_f_cumul(1)=new_014_f(1);
    new_014_f_cumul(i)=new_014_f_cumul(i-1)+new_014_f(i);
    
    new_1559_f_cumul(1)=new_1559_f(1);
    new_1559_f_cumul(i)=new_1559_f_cumul(i-1)+new_1559_f(i);
    
    new_60plus_f_cumul(1)=new_60plus_f(1);
    new_60plus_f_cumul(i)=new_60plus_f_cumul(i-1)+new_60plus_f(i);
    
    new_unknown_cumul(1)=new_unknown(1);
    new_unknown_cumul(i)=new_unknown_cumul(i-1)+new_unknown(i);
end


% deaths
new_deaths_014_m=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0];
new_deaths_1559_m=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	1	0	1	1	1	0	0	0	0	1	0	1	0	1	0	0];
new_deaths_60plus_m=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	1	0	0	1	0	0	0	0	0	0	1	0	0	0	0	1	0	0	1	0	0	0	0	0	0];

new_deaths_014_f=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0];
new_deaths_1559_f=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0];
new_deaths_60plus_f=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0];

new_deaths_unknown=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0];

for i=2:length(new_deaths_014_m)
    new_deaths_014_m_cumul(1)=new_deaths_014_m(1);
    new_deaths_014_m_cumul(i)=new_deaths_014_m_cumul(i-1)+new_deaths_014_m(i);
    
    new_deaths_1559_m_cumul(1)=new_deaths_1559_m(1);
    new_deaths_1559_m_cumul(i)=new_deaths_1559_m_cumul(i-1)+new_deaths_1559_m(i);
    
    new_deaths_60plus_m_cumul(1)=new_deaths_60plus_m(1);
    new_deaths_60plus_m_cumul(i)=new_deaths_60plus_m_cumul(i-1)+new_deaths_60plus_m(i);
    
    
    new_deaths_014_f_cumul(1)=new_deaths_014_f(1);
    new_deaths_014_f_cumul(i)=new_deaths_014_f_cumul(i-1)+new_deaths_014_f(i);
    
    new_deaths_1559_f_cumul(1)=new_deaths_1559_f(1);
    new_deaths_1559_f_cumul(i)=new_deaths_1559_f_cumul(i-1)+new_deaths_1559_f(i);
    
    new_deaths_60plus_f_cumul(1)=new_deaths_60plus_f(1);
    new_deaths_60plus_f_cumul(i)=new_deaths_60plus_f_cumul(i-1)+new_deaths_60plus_f(i);
    
    new_deaths_unknown_cumul(1)=new_deaths_unknown(1);
    new_deaths_unknown_cumul(i)=new_deaths_unknown_cumul(i-1)+new_deaths_unknown(i);
end
