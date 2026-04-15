```@raw html
<img src="https://raw.githubusercontent.com/itsdfish/TrueAndErrorModels.jl/gh-pages/dev/assets/logo_readme.png" alt="drawing" width="900"/>
```
# Model Overview

One challenge in evaluating theories of decision making is that data likely reflect a mixture of true preferences and response error. Suppose a person selects risky option $\mathcal{R}$ over safe option $\mathcal{S}$. This response could arise through two different pathways. First, a person may truly prefer $\mathcal{R}$ over $\mathcal{S}$ and report his or her preferences accurately. Alternatively, this person may truly prefer $\mathcal{S}$, but select $\mathcal{R}$ accidentially due to various factors,  such as trembling hand, failures of memory and/or reasoning, and lapses of attention. True and Error Theory (TET; Birnbaum & Quispe-Torreblanca, 2018) provides a mathematical framework for distinguishing true preferences from errors.  

# Task

TET can be applied to a wide variety of tasks in which subjects make repeated decisions from the same choice sets. As a simple example, we will consider a decision making task in which subjects choose between two sets of options: 

``\mathcal{C}_1 = \{\mathcal{R}_1,\mathcal{S}_1\}``

and 

 ``\mathcal{C}_2 = \{\mathcal{R}_2,\mathcal{S}_2\}``,

where $\mathcal{R}$ represents a risky gamble and $\mathcal{S}$ represents a safe gamble. In general, a generic gamble $\mathcal{G}$ is defined by the discrete payoff distribution:
 
``\mathcal{G} = (x_{1}, p_{1}; \dots; x_{n}, p_{n}),`` 

where outcome $x_i$ occurs with probability $p_i$. The key difference between gambles $\mathcal{R}$ and $\mathcal{S}$ is that $\mathrm{Var}[\mathcal{R}] > \mathrm{Var}[\mathcal{S}]$. An important requirement for TET is that subjects select an option from both choice sets at least twice within the same session. Assuming two replications each, the resulting joint response set contains 16 possible response patterns: 

``\{(\mathcal{R}_1\mathcal{R}_2,\mathcal{R}_1\mathcal{R}_2),(\mathcal{R}_1\mathcal{R}_2,\mathcal{R}_1\mathcal{S}_2), \dots, (\mathcal{S}_1\mathcal{S}_2,\mathcal{S}_1\mathcal{S}_2)\}``.

# True and Error Theory

As noted above, TET provides a mathematical framework for distinguishing between true preferences and response errors. According to TET, there are four possible preference states, one for each possible option: RR, RS, SR, SS. For example, preference state SR indicates a person pefers the safe option in the first choice set, and the risky option in the second choice set. If this person responded without error, his or her response pattern would be ``(\mathcal{S}_1\mathcal{R}_2,\mathcal{S}_1\mathcal{R}_2)``.

## Parameters

The full TET model contains 8 parameters in total: four preference state parameters and four error parameters. Sometimes this model is called the TET4 model, with 4 signifying the number of error parameters. Four of the parameters represent the joint probability of the four true preference states:

- ``p_{\mathrm{R_1R_2}}``: the probability of prefering the risky option in both choice sets
- ``p_{\mathrm{R_1S_2}}``: the probability of prefering the risky option in the first choice set and prefering the safe option in the second choice set
- ``p_{\mathrm{S_1R_2}}``: the probability of prefering the safe option in the first choice set and prefering the risky option in the second choice set
- ``p_{\mathrm{S_1S_2}}``: the probability of prefering the safe option in both choice sets

subject to the constraint that ``p_{\mathrm{R_1R_2}} + p_{\mathrm{R_1S_2}} + p_{\mathrm{S_1R_2}} + p_{\mathrm{S_1S_2}} = 1``.

The remaining four parameters correspond to error probabilities:

- ``\epsilon_{1}``: the error probability in block 1.
- ``\epsilon_{2}``: the error probability in block 2.
- ``\epsilon_{3}``: the error probability in block 3.
- ``\epsilon_{4}``: the error probability in block 4.

## Structure

The TET model is structured as a multinomial processing tree in which nodes correspond to cognitive states or processes, and branches correspond to transition probabilities. In total, the TET model has 16 equations, corresponding to the 16 possible response patterns. Each equation is displayed below. As an example, consider the first equation, which corresonds to response pattern $(\mathcal{R}_1\mathcal{R}_2$,$\mathcal{R}_1\mathcal{R}_2)$. Although the risky option was selected for each decision, the TET model proposes that the response pattern could have been generated from any of the four preference states enumerated above. Each possible preference state occurs with a given probability and produces the observed choice pattern with a combination of correct and error responses. As an example, consider the first term in $\theta_1$ in which the assumed preference state is RR:

``p_{\mathrm{R_1R_2}} \cdot (1 - \epsilon_{\mathrm{S}_1}) \cdot (1 - \epsilon_{\mathrm{S}_2}) \cdot (1 - \epsilon_{\mathrm{S}_1}) \cdot (1 - \epsilon_{\mathrm{S}_2}).``

Under this assumption, each response is produced by correctly reporting the preference state. Hence, all four terms with $\epsilon_i$ use the complementary probability $1 - \epsilon_i$. Now consider the fourth term in which the assumed preference state is SS: 

``p_{\mathrm{S_1S_2}} \cdot \epsilon_{\mathrm{R}_1} \cdot \epsilon_{\mathrm{R}_2} \cdot \epsilon_{\mathrm{R}_1} \cdot \epsilon_{\mathrm{R}_2}.``

Under this alternative assumption, all four responses are produced through error. A similar line of reasoning is used to define the remaining equations below.


### $BBBB$
```math
\theta_{1} =
    b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sb \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
    b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
    (1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sf \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
    (1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4})
```

### $FBBB$
```math
\theta_{2} =
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sb \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sf \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4})
```
### $BFBB$
```math
\theta_{3} =
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sb \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sb) \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sf \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4})
```
### $FFBB$
```math
\theta_{4} =
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sb \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sb) \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sf \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4})
```
### $BBFB$
```math
\theta_{5} =
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sb \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sf \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sf) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4})
```
### $FBFB$
```math
\theta_{6} =
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sb \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sf \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sf) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4})
```
### $BFFB$
```math
\theta_{7} =
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sb \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sf \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4})
```
### $FFFB$
```math
\theta_{8} =
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sb \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sf \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4})
```
### $BBBF$
```math
\theta_{9} =
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sb \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sf \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4}
```
### $FBBF$
```math
\theta_{10} =
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sb \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sf \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4}
```
### $BFBF$
```math
\theta_{11} =
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sb \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sb) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sf \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4}
```
### $FFBF$
```math
\theta_{12} =
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sb \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4} + \\
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sb) \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sf \cdot \epsilon_{3} \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot (1 - \epsilon_{3}) \cdot \epsilon_{4}
```
### $BBFF$
```math
\theta_{13} =
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sb \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
b \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sf \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sf) \cdot \epsilon_{3} \cdot \epsilon_{4}
```
### $FBFF$
```math
\theta_{14} =
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sb \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
b \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sf \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sf) \cdot \epsilon_{3} \cdot \epsilon_{4}
```
### $BFFF$
```math
\theta_{15} =
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot sb \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
b \cdot (1 - \epsilon_{1}) \cdot \epsilon_{2} \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot sf \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot \epsilon_{1} \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot \epsilon_{3} \cdot \epsilon_{4}
```
### $FFFF$
```math
\theta_{16} =
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot sb \cdot \epsilon_{3} \cdot \epsilon_{4} + \\
b \cdot \epsilon_{1} \cdot \epsilon_{2} \cdot (1 - sb) \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot sf \cdot (1 - \epsilon_{3}) \cdot (1 - \epsilon_{4}) + \\
(1 - b) \cdot (1 - \epsilon_{1}) \cdot (1 - \epsilon_{2}) \cdot (1 - sf) \cdot \epsilon_{3} \cdot \epsilon_{4}
```
# References

Birnbaum, M. H., & Quispe-Torreblanca, E. G. (2018). TEMAP2. R: True and error model analysis program in R. Judgment and Decision Making, 13(5), 428-440.