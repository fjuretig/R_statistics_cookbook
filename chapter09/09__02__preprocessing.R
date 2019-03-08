library(MASS)
library(caret)

control <- trainControl(method="repeatedcv", number=4, repeats=1)
tunegrid <- expand.grid(.mtry=c(2,3,4,5,6,7,8))
data <- Boston
train(medv~., data=data,preProcess=c("scale","center","pca"), method="rf", metric="RMSE",
       tuneGrid=tunegrid, trControl=control)
  
  
train(medv~., data=data, method="rf", metric="RMSE", tuneGrid=tunegrid, trControl=control)
  
  
trainIndex <- createDataPartition(Boston$medv, p = .75, list = FALSE, times = 1)
traindata <- Boston[trainIndex,]
testdata <- Boston[-trainIndex,]


preprocess_object <- preProcess(traindata[-14],method=c("scale","center","pca"),pcaComp=4)
x_transformed <- predict(preprocess_object,traindata[-14])
combined_train_data <- cbind(x_transformed,traindata[14])


control <- trainControl(method="none")
tunegrid <- expand.grid(.mtry=c(4))
m3 <- train(medv~., data=combined_train_data, method="rf",
            metric="RMSE", tuneGrid=tunegrid, trControl=control)


test_xdata <- predict(preprocess_object,testdata[-14])
y_test_pred <- predict(m3,test_xdata)


postResample(pred = y_test_pred, obs = testdata$medv)

preProcess(traindata[-14],method=c("scale","center","pca"),thresh=0.9)
traindata[1:10,1] = NA
preProcess(traindata[-14],method=c("knnImpute"))
