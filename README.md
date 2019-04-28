# Team Aniname - Can you hack it 2019
27 Apr - 28 Apr 2019

This is a ~24h hackathon for banking/financial related problems. 
The team consists of: 
1. Brendon Chong Zheng Lee
2. Xanthe Mei Ching Ko
3. Ludwig Kian Soon Hoon

See demo @ https://youtu.be/0nwkHl-TfZA 

## The problem

The following were some of the problems that we wanted to solve:
1. How can we make bank friendly & approacheable for millennials?
2. How can we help the bank to be greener in their operations?
3. How can we encourage consumer, especially first time buyer to consider environment impact when they choose their home?

## The solution

We went through the website of several different banks in Malaysia. We found that:
1. There are some great UI helping consumer to find the suitable loan to finance their home. 
2. Many of the banks also target first time buyer.
3. Whilst there are "apply now" for some of the website, all of them simply ask users to put their contact information and there is currently no way for a person to apply for a mortgage online. 

No (3) means that a lot of the processes involve the individuals going to the banks and filling the paper forms (which we found to consist of monstrous 17 pages).
We understand that the form is not digitised partly because mortgage is a different & complex financial product and banks want to ensure that consumers are making informed decision. 

More and more data and processes are being digitised and we think that it is also time to tackle the **digitisation of mortgage application**. 
However, we also want to ensure that consumers are not adversely affected by the digitisation process and we want to **humanise the banking processess**. 
We created an integrated platform that helps consumer to get a mortgage and also support them with their application online with a custom built **chatbot that utilise several knowledge sources**.
We also want to guide the users through a step-by-step process to get their mortgage loan approved and whenever possible, give them actionable suggestion so that they may improve their credit score. 
At the same time, we want to get more consumers to **opt out paper bank/loan statement**. 

To achieve that, we specifically target the millennials looking to buy their first home, because:
1. They are going to be one of the largest segment of customers in the housing market. 
2. They are fairly comfortable with using technology to conduct business. 
3. They are also much more environment conscious but would sacrifice that when they have to choose between environment and price. 

## APIs used

It is a requirement in the competition that we utilise at least an API from either Rakuten or Google cloud. We utilised several APIs listed here:
1. **Google Maps** - to display the area and display suggestions. 
2. **dialogFlow** - to create the chatbot with different knowledge sources.  
3. **sendGrid** - to send confirmation email. 
4. **FaceSoft** - to do authentication based on facial recognition. 

## Values
We believe that the adoption of this solution will bring the following values:
1. Saving operation cost - by digitising the processes & reducing the printing of forms, statements, etc. 
2. Reducing environment impact - by reducing the paper usage
3. Drive social change - making consumers more environment conscious

## Challenges to be solved

There remain challenges to be solved, in particular:
1. Humanising the form, leveraging data from as many sources as possible so that users only need to input the minimum. 
2. Improving the knowledge of the chatbot, so that they can answer user's questions 95% of the time. 
3. Using a list of business process rules to filter the applications saving the time for reviewers who ultimately make the decision. 
