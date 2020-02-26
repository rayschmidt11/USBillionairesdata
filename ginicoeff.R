#Please make sure to run package installer before running this script
#creates a map displaying the Inequality (Gini) Coefficient for each state
library(htmltab)
library(usmap)
library(ggplot2)
htmltab("https://en.wikipedia.org/wiki/List_of_U.S._states_by_Gini_coefficient#List_of_U.S._states_by_Gini_coefficient_of_income_inequality",3)

giniCoef <- htmltab("https://en.wikipedia.org/wiki/List_of_U.S._states_by_Gini_coefficient#List_of_U.S._states_by_Gini_coefficient_of_income_inequality",3)
ginco <- giniCoef$`Gini Coefficient`
ginco <- as.numeric(ginco)
state <- giniCoef$`State or federal district`
coef <- data.frame(state = state, Gini = ginco )

plot_usmap(data = coef ,values = "Gini")+
  scale_fill_continuous(limits = c(0.39, 0.55),low = "white", high = "red", name = "Gini Coefficient", label = scales::comma)+
  labs(title = "Gini Coefficient by State", subtitle = "Displaying wealth inequality variation between states.\nA coefficient of 0 would mean that each member of \nthe population has the same wealth")+
  theme(legend.position = "right")
