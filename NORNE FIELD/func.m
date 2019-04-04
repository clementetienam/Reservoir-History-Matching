function FP=func(a,alpha,Na)
up=1-((1/a)^(Na-1));
down=1-(1/a);
FP=alpha-(up/down);