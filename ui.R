# Colomaranian FinalProject
# UI

library(shiny)

our.ui <- fluidPage(
  titlePanel("Analyze Disease Patterns Around the World"),
  
  # Page Select
  navbarPage("Team Colomaranian",
    tabPanel("About Our Project",
    p("In an attemp to understand infectious diseases that have for centuries taken the lives of millions,
      we have created this shiny app that focuses on four infectious diseases that are worlds biggest killers. 
      We will explore HIV/AIDS, Malaria, TB and Cholera. These four continue to take the lives of millions every 
      year due to unsanity conditions and the absence of medication to treat the diseases."),
    h3(" A deeper look"),
    p("For all four of these diseases, there are treatments (for some of them cures even). The problem and raeson why 
       so many people continue to fight and die to these diseases is the lack of education to prevent them from contracting
       the disease and due to poor health care systems in their country. The medication and treatment is not avalible to them 
       simply because they don't have enough money to buy it. Thankfully there are NGOs(non-governmental organizations) that help
       provide this needed aid. The Globla Fund a fund stated by the UN to stop the spread and future deaths of HIV/AIDS,TB
       and Malaria. With the help of the global fund over 20.9 million people are reciving treatment for HIV/AIDS out of the 
       36.1 million currently living with HIV/AIDS (Unaids.org). There has been such wonderful work done, yet there still need 
       in treatments, diagnostics, therapy, social and community support and most importantly education."),
    em("All information was retrieved from the WorldBank, the World Health organization, The Global Fund, CDC.org
        and lung.org")
    ),
    tabPanel("Cholera Page",
             plotOutput("Cholera_plot"),
             uiOutput("dropdown1"),
             radioButtons(
               inputId="radio1",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
             ),
             h4("What is cholera? "),
             p("Cholera is a diarrheal illness that is caused by the bacterium Vibrio cholerae. 
                The thing about cholera is that enough of the bacterium must be consumed to get
               cholera symptoms. Once the bacterium is in the small intestine it secretes its
               toxins which result in the patient having violent vomiting and diarrhea that then
               leads to dehydration, weakness and if not treated in time or at all, it will lead to death."),
             div(),
             h4("Transmission methods"),
             p(" For most people cholera is a thing from the past, due to better sanitary conditions. One of the
                 main reasons of high transmission or prevalence is due to poor sanitary conditions.
                 The spread of cholera is a cycle; first someone sick with cholera can say defecate in the open by
                 a water source, one of the ways of transporting cholera is by allowing it to leak into the water
                 source and contaminating the body of water other people in the village use to bath, collect their
                 drinking water and wash their clothes. Let’s say someone then collects the contaminated water and 
                 takes it back to their home for their family to drink. The family members will drink it, gets sick 
                 then starts feeling the symptoms of the runs and vomiting that would both carry cholera. They too
                 choose to defecate in the open and the cycle repeats itself."),
             div(),
             h4("Prevention methods"),
             p("Education is the most important type of prevention. People in areas where cholera is prevalent
                are told to boil water for 1 minute before consumption, cover their food to protect it from landing flies
               (that can carry cholera), wash hands after using the bathroom (since cholera bacteria can remain on hands),
               use latrine far enough from water sources, use chorine drops on collected water and eat food while its
               hot. If the individual contracts cholera they must use ORT (Oral Rehydration Therapy) to rehydrate and
               must receive medical attention."),
             div(),
             h4("Treatments"),
             p("ORT consists of 1 fist of sugar and three finger pinches of salt into a liter of water. Doctors treating
                patients prioritize rehydrating the patient because the symptoms and (bacteria) only remain in the body
                for a couple of days.Patients tend to recover quickly  if they are not suffering from an underlying cause
                like malnutrition. Because one of the main symptoms and dangers to cholera is massive dehydration, cholera 
                can easily cause death especially in young malnourished children or adults the same."), 
             em("All information was retrieved from the WorldBank, the World Health organization, The Global Fund, CDC.orgn 
                and lung.org")
             ),
    tabPanel("Malaria Page",
             plotOutput("Malaria_plot"),
             uiOutput("dropdown2"),
             radioButtons(
               inputId="radio2",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
               ),
             h4("Malaria"),
             p("Malaria is a disease caused by the Plasmodium parasites. Nearly 3.2 billion people – nearly half of the world's
               population is at risk for malaria. 90% of malaria cases are in Africa Thankfully malaria is treatable and curable.
               There are 5 different types of this parasite species, 2 of which are the greatest threat. The parasite has 3 main
               stages inside the body. During the first stage it resides in your liver, that being 7-9 days after mosquito bite,
               at this stage the individual feels no symptoms. The second stage is when you get sick, the parasite enters your
               red blood cells, reproduces inside it until the red blood cell bursts and then find another red blood cell to infect.
               In the last stage, being once it is in the blood stream it gets picked up again by the mosquito and once inside the
               mosquito mates with other parasites that would then continue the cycle."),
             div(),
             h4("Transmission"),
             p("Malaria is transmitted through blood; the main way is through mosquito bites. The mosquito that is host to the
               parasite are the female Anopheles mosquitos"),
             div(),
             h4("Prevention methods"),
             p("vector control is the main way to prevent malaria, this includes; bed nets, spraying walls with pesticides,
               getting rid of still water and education."),
             div(),
             h4("Treatments"),
             p("Medicine is available depending on the geographical location of the patient.The things about this medication is it must be 
               taken like clockwork and can have some nasty side effects. The downside to this is like any other organisum the parasite will
               evolve and become immune to previous medication. Another downside to treatment is access to medications. Some individuals simply
               cannot afford it and need help from external sources like the Global Fund that provides health care services to low-income or highly
               in debt countries."),
             div(),
             em("All information was retrieved from the WorldBank, the World Health organization, The Global Fund, CDC.org
                and lung.org")
             ),
    tabPanel("HIV Page",
             plotOutput("HIV_plot"),
             uiOutput("dropdown3"),
             radioButtons(
               inputId="radio3",
               label="Select Data to Display:",
               choices=c("Reported Deaths", "Reported Cases")
               ),
             h4("HIV/AIDS"),
             p("HIV also known as Human Immunodeficiency Virus. HIV/AIDS has become one of the world’s most serious health and
               development challenges. Individuals are diagnosed with AIDS (Auto Immune Deficiency Syndrome) when their CD-4 count
               drops below 200 cells m/m or if they become subjective to an opportunistic illness.  A person doesn’t die from
               HIV/AIDS they die from an opportunistic infection like TB and pneumonia. According unaids.org, 36.7 million people
               are living with HIV in 2016, 1.8 million of which were newly infected. HIV/AIDS is treatable and controllable but not
               curable, that is if one gets infected with HIV they’re going to have it for the rest of their lives. The reason its
               not curable is because in the process of changing the virus’s RNA to DNA, there are mistakes made by the viruses reverse
               transcriptions. The reverse transcriptions don’t check for errors (think of it like copying a lecture slide down but not
               looking down to what your writing), this results in mutations in the DNA of the virus; meaning there is huge HIV diversity
               even in one HIV positive individual. The region of the world most badly hit is sub-Saharan Africa that has 70% of HIV/AIDS
               positive individuals living there."),
             div(),
             h4("Transmission"),
             p("HIV is transmitted through bodily fluids including blood, semen, vaginal fluid breast milk, etc. Can also be transmitted
               from mother to child during birth."),
             div(),
             h4("Prevention"),
             p("The best way to prevent transmission is through education and practicing smart behaviors, including; using protection
               always(condoms), limiting sex partners, not sharing needles. HIV/AIDS is mostly transmitted during sex."),
             div(),
             h4("Treatments"),
             p("The main treatment is called ART (antiretroviral therapy) that attacks the HIV virus in all stages of attack. People who
               have HIV treatment can live long healthy lives. Unfotuently only a fraction of the population living with HIv today are recieving 
               treatment. To provide medications for such need NGO's like the Global fund set up delivery vertical aid to those in need. "),
             div(),
             em("All information was retrieved from the WorldBank, the World Health organization, The Global Fund, CDC.org
                and lung.org")
             ),
    tabPanel("TB Page",
            plotOutput("TB_plot"),
            uiOutput("dropdown4"),
            radioButtons(
            inputId="radio4",
            label="Select Data to Display:",
            choices=c("New Patient Success Rate", "Previously Treated Patient Success Rate")
            ),
             h4("Tuberculosis: TB "),
             p("Tuberculosis is an airborne disease caused by Mycobacterium tuberculosis (lung.org) The disease usually infects 
               the lungs, but can also spread to other parts of the body and have devastating results. There are two types of TB,
               active and latent TB. A person with active Tb is contagious while one with latent TB is not. The thing about latent
               TB is someone can have It for years and not now, the danger occurs once TB becomes active due to sudden weakness of
               the immune system. According to Lung.org, about 2.5 billion people, or one third of the worlds population is infected 
               with TB (either latent or active TB), while 9 million become sick annually (acphd.org). "),
             div(),
             h4("Transmission"),
             p("Lung TB is transmitted from person to person by little air droplets. If a person that is TB positive coughs, talks
               or even breaths, they are exposing others to TB. Therefore, the disease is so prevalent and deadly. "),
             div(),
             h4("Prevention"),
             p("The only prevention method would be to stay away from someone you know has active TB. There is no vaccination or
               treatments that would make your body less inhabitable for the disease."),
             div(),
             h4("Treatments"),
             p("There are treatments for TB and thankfully it is fully curable, but the treatment received depends on if you have a TB
               infection(latent) or suffer from the TB disease(active) (lung.org). For latent Tb, patients receive preventive therapy
               that kills the Tb bacterium. Medicine needs to be taken for 6 to 9 months (lung.org).  Active Tb users would take several
               medications for 6 months to a year. The worst 2 kinds of TB are drug-resistant and multi-drug-resistant Tb, this form of 
               TB occurs when patients do not take their medications correctly or they stopped taking them before they should have.
               Drug-resistant TB and multi-drug-resistant TB are the hardest to treat due to limited drug options that would kill the bacterium. "),
             div(),
             em("All information was retrieved from the WorldBank, the World Health organization, The Global Fund, CDC.org
                and lung.org")
             )
  )
  
)

shinyUI(our.ui)
