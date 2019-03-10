data = read.csv("./paired_scores.csv") 
t.test(data$Score2,data$Score1,conf.level = .95,alternative="greater",paired=TRUE) 
t.test(data$Score2,data$Score1,conf.level = .95,alternative="less",paired=TRUE) 