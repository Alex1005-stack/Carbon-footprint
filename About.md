<b>An investment in the past</b>

<b>I. Background</b>

This project aims to increase transparency on the carbon footprint that students at Harvard take on yearly by enjoying the benefits of the Harvard endowment in financing school operations.

<b>II. Data collection</b>

The data used in these visualization falls in three categories:

<b>1. Data on securities reported by the Harvard Management Company</b>

1.  SEC filings: Every Quarter the Harvard Management Company needs to
    file form 13F to the U.S. Security and Exchange Commission. While
    the form includes all US-listed equity securities (including ETFs),
    the great majority of investment instruments do not require
    disclosure. Therefore, only ~$405 Million of the ~$40.9 billion
    assets under management or about 1% are disclosed. For lack of a
    better alternative, I will presume in my analysis that the disclosed
    assets reflect the composition of the undisclosed assets. the The
    data form used here was filed on 09/08/2019.

<a href="https://www.sec.gov/Archives/edgar/data/1082621/000095012319007448/xslForm13F_X01/form13fInfoTable.xml" class="uri">https://www.sec.gov/Archives/edgar/data/1082621/000095012319007448/xslForm13F_X01/form13fInfoTable.xml</a>

1.  FTE’s: Around 20.5% of the reported securities are not held by HMC
    directly, but via FTE’s. The holdings of these FTE’s and their
    relative shares, could be accessed via the websites of the
    respective asset managers. The data used here was reported
    09/30/2019.

INVESCO QQQ TR:
<a href="https://www.invesco.com/portal/site/us/investors/etfs/holdings/?ticker=QQQ" class="uri">https://www.invesco.com/portal/site/us/investors/etfs/holdings/?ticker=QQQ</a>
ISHARES TR CORE S&P500 ETF:
<a href="https://www.ishares.com/us/products/239726/ishares-core-sp-500-etf" class="uri">https://www.ishares.com/us/products/239726/ishares-core-sp-500-etf</a>
ISHARES TR CORE S&P MCP ETF:
<a href="https://www.ishares.com/us/products/239763/ishares-core-sp-midcap-etf" class="uri">https://www.ishares.com/us/products/239763/ishares-core-sp-midcap-etf</a>
ISHARES TR CORE S&P SCP ETF:
<a href="https://www.ishares.com/us/products/239774/ishares-core-sp-smallcap-etf" class="uri">https://www.ishares.com/us/products/239774/ishares-core-sp-smallcap-etf</a>
SPDR GOLD TRUST GOLD SHS: holding only treasury coupons and strips, not
needed for the purposes of this analysis  
VANGUARD GROUP DIV APP ETF:
<a href="https://advisors.vanguard.com/investments/products/vig/vanguard-dividend-appreciation-etf#portfolio" class="uri">https://advisors.vanguard.com/investments/products/vig/vanguard-dividend-appreciation-etf#portfolio</a>
VANGUARD INTL EQUITY INDEX F FTSE EMR MKT ETF:
<a href="https://institutional.vanguard.com/web/cf/product-details/fund/0964" class="uri">https://institutional.vanguard.com/web/cf/product-details/fund/0964</a>
VANGUARD TAX MANAGED INTL FD FTSE DEV MKT ETF:
<a href="https://institutional.vanguard.com/web/cf/product-details/fund/0936" class="uri">https://institutional.vanguard.com/web/cf/product-details/fund/0936</a>
VANGUARD WORLD FD EXTENDED DUR: holding only treasury coupons and
strips, not needed for the purposes of this analysis

In combination they allowed me to create a CSV file, titled “HMC filed
securities Q3 2019” which contains all direct and indirect holdings as
reported by the HMC and their relative share in the portfolio.

<b>2. CDP data base on the self-reported greenhouse gas emissions by
companies</b>

1.  CDP data The CDP (formerly the Carbon Disclosure Project) is an
    organisation based in the United Kingdom which supports companies
    and cities to disclose the environmental impact of major
    corporations. It aims to make environmental reporting and risk
    management a business norm, and drive disclosure, insight and action
    towards a sustainable economy.

2.  Maniuplation of CDP data The available time series (2010 - 2018) was
    combined to ensure inclusion of the most up to date data available
    for as many companies as possible.

3.  Data privacy The data set includes for more than 2,000 of the
    biggest companies self-reported information on carbon footprint,
    low-carbon transformation strategy and organizational manifestations
    of them from 2010 to 2018. As the data is proprietory I am not
    sharing it in my GitHub repo.

<b>3. Data on utilitizaiton of endowment income</b>

For tailoring the carbon footprint via endowment to the specific
student’s experience, I will use the spending patterns of the endowment
income as suggested by the 2018 Harvard Annual financial report and the
2016 Congressional Report.

<a href="https://finance.harvard.edu/annual-report" class="uri">https://finance.harvard.edu/annual-report</a>
<a href="https://www.harvard.edu/about-harvard/harvard-glance/endowment" class="uri">https://www.harvard.edu/about-harvard/harvard-glance/endowment</a>

<b>III. Additional remarks</b>

In order to quantify the damages of the suggested carbon footprint per
student, I will leverage the assumptions (e.g. interest rate) of the
Stern report.

<b>IV. About Me:</b> My name is Alexander Klueber. I am an Master in
Public Policy student at the Harvard Kennedy School passionate about
data science and transitioning our economies to a low carbon future.
Contact me at
<a href="mailto:alexander_klueber@hks.harvard.edu" class="email">alexander_klueber@hks.harvard.edu</a>.