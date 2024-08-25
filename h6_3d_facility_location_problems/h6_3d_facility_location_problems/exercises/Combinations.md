# Combinations

```python
nCr = lambda n, r: 1 if r == 0 
    else n * nCr(n - 1, r - 1) // r
```


$$
nCr = \frac{n!}{r!(n - r)!}
$$

So 5 choose 3 is $ \frac{5!}{3!(5 - 3)!} $ 

which is $ \frac{5*4*3*2*1}{3*2*1*2*1} $ 
simplify to $ \frac{5*4}{2*1} $
= 10





