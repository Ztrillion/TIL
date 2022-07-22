# 회귀(Regression)_2

## 경사하강법(Gradient Descent)

- 비용함수가 최소가 되는 W 파라미터 구하기위한 방법
  - W 파라미터가 많으면 고차원 방정식을 사용해도 해결하기 어려움
  - **경사 하강법**은 고차원 방정식에 대한 문제 해결과 비용함수 RSS를 최소화 하는 방법
  - 머신러닝의 개념을 가능하게 만든 핵심기법 중 하나



### 경사하강법 프로세스



#### y = 4X+6을 근사하기 위한 100개의 데이터 세트를 만들고 

#### 경사하강법을 이용해 회기계수 w1.w0 도출

```python
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

np.random.seed(0)
# y= 4X+6을 근사(W1=4,W0=6). 임의의 노이즈 생성
X = 2 * np.random.rand(100,1)
y = 6+4 * X+np.random.randn(100,1)

plt.scatter(X,y)
```

![](C:\Users\82105\Desktop\Regression\image\gradientDescent1.png)



