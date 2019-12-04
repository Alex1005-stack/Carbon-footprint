# An investment in the past

## <br> I. Problem statement </br>

This project aims to increase transparency on the carbon footprint that students in the various Harvard Schools 'inherit' yearly by enjoying the benefits of the Harvard endowment proceeds in financing their schools' operations. It additionally seeks to visualize the relative magnitude of that additional footprint compared to the average carbon footprint in the US and other potential carbon reduction levers. It furthemore includes an overview of how much carbon is 'inherited' annually from each company in the endowment portfolio (that was filed to SEC and could be matched to CDP data). Lastly, it starts to look into the development of carbon consciousness of the endowment overall and for an average company in the portfolio. 

## <br>II. Data sources</br>

The data used in this project falls into 5 categories:

#### <br>1. CDP data base on self-reported carbon footprint by companies</br>
  - CDP datasets 2010 - 2018 (The CDP (formerly the Carbon Disclosure Project) is an organisation based in the United Kingdom which supports companies and cities to disclose their environmental impact. It aims to make environmental reporting and risk management a business norm, and drive disclosure, insight and action towards a sustainable economy.)
  
##### <br>2. Bloomberg data on market capitalizations</br>
  - Data from Bloomberg on market capitalizations
  
#### <br>3. Data on endowment portfolio reported by the Harvard Management Company</br>
  - <a href="https://www.sec.gov/Archives/edgar/data/1082621/000095012319007448/xslForm13F_X01/form13fInfoTable.xml" class="uri">HMC form 13 F SEC filings </a> 
  - <a href="https://finance.harvard.edu/annual-report" class="uri">Harvard University Financial Report for Fiscal Year 2019</a>
  - Fund management websites:
    - <a href="https://www.invesco.com/portal/site/us/investors/etfs/holdings/?ticker=QQQ" class="uri">INVESCO QQQ TR</a>
    - <a href="https://www.ishares.com/us/products/239726/ishares-core-sp-500-etf" class="uri">ISHARES TR CORE S&P500 ETF</a>
    - <a href="https://www.ishares.com/us/products/239763/ishares-core-sp-midcap-etf" class="uri">ISHARES TR CORE S&P MCP ETF</a>
    - <a href="https://www.ishares.com/us/products/239774/ishares-core-sp-smallcap-etf" class="uri">ISHARES TR CORE S&P SCP ETF</a>
    - <a href="https://advisors.vanguard.com/investments/products/vig/vanguard-dividend-appreciation-etf#portfolio" class="uri">VANGUARD GROUP DIV APP ETF</a>
    - <a href="https://institutional.vanguard.com/web/cf/product-details/fund/0964" class="uri">VANGUARD INTL EQUITY INDEX F FTSE EMR MKT ETF</a>
    - <a href="https://institutional.vanguard.com/web/cf/product-details/fund/0936" class="uri">VANGUARD TAX MANAGED INTL FD FTSE DEV MKT ETF</a>
    - VANGUARD WORLD FD EXTENDED DUR - holding only treasury coupons and strips, not detailed for the purposes of this analysis
    - SPDR GOLD TRUST GOLD SHS - holding only treasury coupons and strips, not detailed for the purposes of this analysis 



#### <br>4. Data on operating revenue financed via "endowment made available for operations"" and size of student body</br>

- Financial reports of Harvard Schools:
    - <a href="https://www.hbs.edu/about/financialreport/2018/Pages/default.aspx" class="uri">Business School</a>
    - <a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjrt-KUtvnlAhXJjFkKHWAxCD0QFjAAegQIAhAC&url=https%3A%2F%2Fwww.gsd.harvard.edu%2Fwp-content%2Fuploads%2F2017%2F03%2FGSD-Factbook.pdf&usg=AOvVaw0PUfHCQy2SDIl0tnkJxPrg" class="uri">Design School</a>
    - <a href="https://www.fas.harvard.edu/files/fas/files/fy19_managerial_report_v7.pdf" class="uri">Faculty of Arts and Sciences</a>
    - <a href="https://hms.harvard.edu/about-hmsfacts-figures/financial-report" class="uri">Medical School</a>

- Websites of all school for size of student body:
    - <a href="https://www.harvard.edu/about-harvard/harvard-glance" class="uri">FAS: College</a>
    - <a href="https://gsas.harvard.edu/about/gsas-glance" class="uri">FAS: GSAS</a>
    - <a href="https://www.seas.harvard.edu/about-us/school-overview" class="uri">FAS: SEAS</a>
    - <a href="https://www.seas.harvard.edu/about-us/school-overview" class="uri">Divinity School</a>
    - <a href="https://hds.harvard.edu/about/hds-glance" class="uri">Divinity School</a>
    - <a href="https://www.google.com/search?client=firefox-b-1-d&ei=DQTlXfy_NufR5gLzpJ34Bw&q=Harvard+Law+school+number+of+students&oq=Harvard+Law+school+number+of+students&gs_l=psy-ab.3..0i70i251.1471.2046..2194...0.3..0.128.479.0j4......0....1..gws-wiz.......0i71j0i7i30j0i8i13i30.1yXMSQo-nn8&ved=0ahUKEwi8-vOI_JbmAhXnqFkKHXNSB38Q4dUDCAo&uact=5" class="uri">Law School</a>
    - <a href="https://www.gsd.harvard.edu/people/student/" class="uri">Design School</a>
    - <a href="https://hms.harvard.edu/about-hms/facts-figures" class="uri">Medical School</a>
    - <a href="https://www.hks.harvard.edu/more/about-us/media/numbers-facts" class="uri">Kennedy School</a>
    - <a href="https://www.google.com/search?client=firefox-b-1-d&ei=IwXlXZvWKK2B5wKCxIfAAQ&q=Harvard+Education+School+number+of+students&oq=Harvard+Education+School+number+of+students&gs_l=psy-ab.3...1634.3009..4754...0.3..0.144.1118.3j7......0....1..gws-wiz.......0i71j33i10.rnkuW_ahjFQ&ved=0ahUKEwjb862N_ZbmAhWtwFkKHQLiARgQ4dUDCAo&uact=5" class="uri">Education School</a>
    - <a href="https://hsdm.harvard.edu/" class="uri">Dental School</a>
    - <a href="https://www.hbs.edu/about/facts-and-figures/statistics/Pages/default.aspx" class="uri">Business School</a>
    - <a href="https://www.google.com/search?client=firefox-b-1-d&ei=vQXlXdKGNavJ5gKc2ZC4CQ&q=Harvard+Public+Health+School+number+of+students&oq=Harvard+Public+Health+School+number+of+students&gs_l=psy-ab.3...1709.4709..4828...2.3..0.162.1881.0j16......0....1..gws-wiz.......0i71j0i8i13i30j33i10.ylusCEtmj6Q&ved=0ahUKEwiS2fHW_ZbmAhWrpFkKHZwsBJcQ4dUDCAo&uact=5">Public Health School</a>
    


#### <br>5. Reference for the relative size of the 'inherited' carbon footprint</br>
- <a href="https://doi.org/10.1088/1748-9326/aa7541" class="uri">Wynes & Nicholas (2017): The climate mitigation gap: education and government recommendations miss the most effective individual actions</a> 
- <a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj52tqh7pbmAhUtqlkKHfLPB9kQFjAAegQIAhAC&url=https%3A%2F%2Fwww.eia.gov%2Ftotalenergy%2Fdata%2Fmonthly%2Fpdf%2Fmer.pdf&usg=AOvVaw38Xx2SWfx06cHWQAO4hnz6" class="uri">EPA Energy Review November 2019</a>


## <br>III. Data cleaning</br>

#### <br>1. CDP data base on self-reported carbon footprint by companies</br>

1. Through the Harvard dataverse I obtained the CDP data for the years 2010 - 2018 in Excel format. The average set per year includes 225 tabs each filled with carbon related data on the various reporting companies. The dataset structure between the years varies (e.g. in terms of column/tab names, tabs with relevant information, elements reported). To facilitate later utilitization of the data, I isolated the relevant Excel tabs for each year and saved them locally independently as <i>Year</i>_carbon footprint..

2. For each of the years I then wrote an individual formula to upload and name the data and consolidated them into one dataset thereafter. I kept for all companies and each year of emission the most up to date data.

Note: Among other information, the data sets include the self-reported carbon footprint, the low-carbon transformation strategy and its organizational manifestations for thousands of the biggest companies in the world. As the data is proprietory I am not sharing any unaltered information from that dataset.


#### <br>2. Bloomberg data on market capitalizations</br>

1. To determine Harvard's relative ownership share in each of these companies, I gathered the market capitalization of each of the companies in the dataset. To do so, I downloaded the ISINs for the companies in the consolidated data set and used the Bloomberg Terminal at the Business School to obtain the relevant information separately and then re-entered it into the analysis.  

Note: Market Cap according on main listed exchange acc. to Bloomberg data based on ISIN per 09/30/19

#### <br>3. Data on endowment portfolio reported by the Harvard Management Company</br>

1. Based on <a href="https://www.sec.gov/Archives/edgar/data/1082621/000095012319007448/xslForm13F_X01/form13fInfoTable.xml" class="uri">form 13 F</a> filed by the Harvard Management Company to the U.S. Security and Exchange Comission (only covers 1% of total endowment), I compiled a list of portfolio companies that Harvard is directly or indirectly invested in. 

2. FTE’s: Around 20.5% of the reported securities are not held by HMC directly, but via FTE’s. The holdings of these FTE’s and their relative shares, could be accessed via the websites of the respective asset managers (see data sources). The data used here was reported 09/30/2019.

3. In combination with the Bloomberg data this allowed me to create a file which contains all direct and indirect holdings as reported by the HMC, their relative share in the reported Harvard Portfolio and the ownership share from the company that translated into (all based on the 1% that are filed to the SEC).

4. As naming conventions between the CDP and this data set differed, I manually harmonized names/tickers where necessary for all companies whose relative share exceeded 0.1%.

Note: Every Quarter the Harvard Management Company files form 13F to the U.S. Security and Exchange Commission. While the form includes all US-listed equity securities (including ETFs), the great majority of investment instruments used by Harvard do not require disclosure. Therefore, only ~$405 Million of the ~$40.9 billion assets under management (or about 1%) are disclosed. The data form used here was filed on 09/08/2019. For lack of a better alternative, I presumed that the disclosed assets reflected the composition of the undisclosed assets. On this basis, I extrapolated from the companies that were reported to the SEC and that could be matched with the CDP data to the entire 40.9 bn USD portfolio. 


#### <br>4. Data on operating revenue financed via "endowment made available for operations"" and size of student body</br>

1. According to the <a href="https://finance.harvard.edu/annual-report" class="uri">Harvard University Financial Report for Fiscal Year 2019</a> (p. 19) Harvard had a total operating revenue of 5.5 billion USD, 35% of which (or 1.9 billion USD) were endowment income made available for operations.

2. To determine how much of the annual carbon footprint owned through the endowment was to be attributed to each school, I used the share of these 1.9 billion USD that annually went to each of them to finance their operations. To do so, I gathered the operating revenues for each Harvard school from their individual websites or financial reports (see data sources for details).

3. For the schools where this was not available, I attribtued what remained of the total operating revenue (the 5.5 billion USD) to the remaining schools via the size of their student body (See data sources for details).

4. To determine the share of the 1.9 bn USD (the operating revenue financed via endowment made available for operations) that was to be attributed to each school, I took each schools total opearting revenue times the share indicated as "Endowment made available for operations" in <a href="https://finance.harvard.edu/annual-report" class="uri">Harvard University Financial Report for Fiscal Year 2019</a> (p. 6) and divided that by the 1.9 billion USD.

## <br>IV. Key assumptions</br>

- The 1% of assets from the endowment that are reported, can be used to extrapulate the footprint for the entire 40.9 bn USD endowment portfolio. (For lack of transparency and a better alternative) 

- Ownership of a company means ownership of the carbon footprint caused by that company. 

- The carbon footprint can be broken down to the level of an individual student via the share of the "endowment income made available for operations" that a particular Harvard school receives and the size of its student body.

- The double counting of carbon in the "Average annual carbon footprint in US per individual" and the "Additional carbon footprint via Harvard Endowment" is of marginal importance for what it seeks to visualize and may therefore be disregarded.

- The Harvard School of Continuing Education is not included because it doesn't use any Harvard endowment proceeds to finance its operations. 

- Radcliffe is not included because it doesn't have a student structure that compares to the other schools.

- The carbon footprint of a company includes Scope 1, Scope 2 and biologically sequestered carbon.


## <br>V. Key definitions</br>

- Carbon footprint: when the graphs refer to the carbon footprint of companies, this includes the sum of scope 1, scope 2 and biologically sequestered carbon as/if reported for a given year in the CDP datasets.

- Scope 1 emissions: Companies report GHG emissions from sources they own or control as scope 1 <a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=20&ved=2ahUKEwiLg9-T-ZbmAhVDwFkKHZsECQUQFjATegQIAhAC&url=http%3A%2F%2Fpdf.wri.org%2Fghg_protocol_2004.pdf&usg=AOvVaw3gMh4sMSFwKj6Vp0w__zsW">(See GHG protocol scope 1)</a>.

- Scope 2 emissions: Companies report the emissions from the generation of purchased electricity that is consumed in its owned or controlled equipment or operations as scope 2 <a href="https://ghgprotocol.org/scope_2_guidance">(See GHG protocol scope 2)</a>. When available, I used location-based scope 2 emissions. If location-based scope 2 was not reported, but market-based scope 2 emisions were reported, I used them.

- MT: Metric tonnes of CO2 equivalents.


## <br>VI. Other course requirements:</br> 

Please find here the <a href="https://github.com/Alex1005-stack/Carbon-footprint.git">source code</a> and a <a href="https://www.youtube.com/watch?v=aMqJtOqotlE&feature=youtu.be">3 minute video</a>.


## <br>VII. About Me:</br> 

My name is Alexander Klueber. I am an Master in Public Policy student at the Harvard Kennedy School, passionate about data science and transitioning our economies to a low carbon future. Contact me at <a href="mailto:alexander_klueber@hks.harvard.edu" class="email">alexander_klueber@hks.harvard.edu</a>.
