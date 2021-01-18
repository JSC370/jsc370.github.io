# CSC 2547 Fall 2019: Learning to Search

<img src="https://yourbasic.org/algorithms/tree.png" width="200">

## Overview
In planning, search, active learning, programming, and approximate inference, we usually face a series of similar tasks.
We can often generalize from the problems solved so far, or even combine parts of previous solutions to solve a new one.
This course will survey foundational ideas, recent work, and applications in this area.
Specifically, it will cover self-improving tree-search methods such as alphazero, meta-learning, hypernetworks, self-tuning gradient estimators, amortized inference, self-improving theorem provers, and planning in POMDPs.
Evaluation will be based mainly on a project involving original research by the students.
Students should already be familiar with the basics of machine learning such as linear algebra, optimization, and probability.

The class will have a major project component, and will be run in a similar manner to [Learning Discrete Latent Structure](https://duvenaud.github.io/learn-discrete/)

## Prerequisites:
This course is designed to bring students to the current state of the art, so that ideally, their course projects can make a novel contribution. A previous course in machine learning such as CSC321, CSC411, CSC412, STA414, or ECE521 is strongly recommended. However, the only hard requirements are linear algebra, basic multivariate calculus, the basics of probability, and programming skills.

To check if you have the background for this course, try taking this [Quiz](skill-quiz/skill-quiz.pdf).  If more than half the questions are too difficult, you might want to put some extra work into preparation.

### Where and When
* Fall 2019
* Instructor: [David Duvenaud](http://www.cs.toronto.edu/~duvenaud)
* Teaching Assistants: [Shengyang Sun](http://www.cs.toronto.edu/~ssy/), [Chris Cremer](https://chriscremer.bitbucket.io/), [Jonathan Lorraine](https://www.cs.toronto.edu/~lorraine/)
* Email: <learn.search.2547@gmail.com> is accessible to instructor and TAs.
* Location: Bahen room 1190
* Time: Fridays, 1-3pm
* Instructor Office hours: Mondays 3-4pm, in Pratt room 384
* Piazza: [https://piazza.com/class/jxdq4fwzvb656y](https://piazza.com/class/jxdq4fwzvb656y)

## Why Learn To Search?

* **Active Learning and Exploration** - Many problems require choosing which data would be most useful to acquire, or which experiment would be most useful to run.  This can be viewed as a search problem: finding a sequential plan that can be expected to provide useful information by the end.  Because we can adjust our plan after every action, we end up running many similar searches.  Thus there is scope to gradually optimize our planning strategy.
 * **Approximate Inference and Inverse Design** - In many situations, we know what a good explanation or design would look like, but need to search through a large discrete set to find one.  For example, given a molecule we can often predict the mass spectra of its fragments, or how well it would perform a task.  However finding a molecule that matches a given requirement is a hard search problem, that might benefit from experience of finding matches for similar tasks.
 * **Program generation** - One of the hardest search tasks that humans regularly perform is programming, which can be viewed as a search for programs that meet a specification.  One strategy for building large programs is to practice by building smaller programs to solve related problems.  Programming is also a domain where one can often usefully re-use parts of other solutions.
 

## Course Structure

Aside from the first two and last two lectures, each week a different group of students will present on a set of related papers covering an aspect of these methods.  I'll provide guidance to each group about the content of these presentations.

In-class discussion will center around understanding the strengths and weaknesses of these methods, their relationships, possible extensions, and experiments that might better illuminate their properties.

The hope is that these discussions will lead to actual research papers, or resources that will help others understand these approaches.

Grades will be based on:

  * [15%] One [assignment](assignment/ltsa1.pdf), due Oct 3, to be handed in through [MarkUs](https://markus.teach.cs.toronto.edu/csc2547-2019-09/en/main).
      - [Tex](assignment//ltsa1.tex) | [imsart.cls](assignment/imsart.cls) | [imsart.sty](assignment/imsart.sty) | [macros.tex](assignment/macros.tex)
  * [15%] Class presentations. [Rubric](paper-presentation-rubric.md)
  * [15%] Project proposal, due Oct 17th. [Rubric](project-proposal-rubric.md)
  * [15%] Project presentations, November 22nd and 29th. [Rubric](project-presentation-rubric.md)
  * [40%] Project report and code, due Dec 18th. [Rubric](project-rubric.md)


### Project
Students can work on projects individually, or in groups of up to four. The grade will depend on the ideas, how well you present them in the report, how clearly you position your work relative to existing literature, how illuminating your experiments are, and well-supported your conclusions are.
Full marks will require a novel contribution.

Each group of students will write a short (around 2 pages) research project proposal, which ideally will be structured similarly to a standard paper.
It should include a description of a minimum viable project, some nice-to-haves if time allows, and a short review of related work.
You don't have to do what your project proposal says - the point of the proposal is mainly to have _a_ plan and to make it easy for me to give you feedback.

Towards the end of the course everyone will present their project in a short, roughly 5 minute, presentation.

At the end of the class you'll hand in a project report (around 4 to 8 pages), ideally in the format of a machine learning conference paper such as [NIPS](https://nips.cc/Conferences/2016/PaperInformation/StyleFiles).

## Calendar

<iframe src="https://calendar.google.com/calendar/embed?src=6u8p7psn97hmm3o1i5op6spel8%40group.calendar.google.com&ctz=America%2FToronto" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>


## Tentative Schedule
---
### Week 1 - September 13th - Background, motivation, course setup

This lecture will set the scope of the course, the different settings where amortized search can be useful, and the main existing approaches. [Slides](slides/lecture1.pdf)

***
### Week 2 - September 20th - Tutorial on main existing approaches, history of field

 - [Slides](https://duvenaud.github.io/learning-to-search/slides/lecture2.pdf)
 - Basics of search, tree search
 - Discrete gradient estimators
 - Relaxations
 
 Recommended reading:
  - [Gradient Estimation Using Stochastic Computation Graphs](https://arxiv.org/abs/1506.05254)
  - [Backpropagation through the Void: Optimizing control variates for black-box gradient estimation](https://arxiv.org/abs/1711.00123) [code](https://github.com/duvenaud/relax)
  
Related papers:
  - The original [REINFORCE](http://www-anw.cs.umass.edu/~barto/courses/cs687/williams92simple.pdf) paper.
  - [The Concrete Distribution: A Continuous Relaxation of Discrete Random Variables](https://arxiv.org/abs/1611.00712) - a simple trick: turn all the step functions into sigmoids, and use backprop to get a biased gradient estimate.
  - [Categorical Reparameterization with Gumbel-Softmax](https://arxiv.org/abs/1611.01144) - the exact same idea as the Concrete distribution, published simultaneously.
  - [REBAR: Low-variance, unbiased gradient estimates for discrete latent variable models](https://arxiv.org/abs/1703.07370) - fixes the concrete estimator to make it unbiased, and also gives a way to tune the temperature automatically.
  - [Stochastic Backpropagation and Approximate Inference in Deep Generative Models](https://arxiv.org/abs/1401.4082) - one of the modern explanations of the reparameterization trick.


***
### Week 3 - September 27th - Monte Carlo Tree Search and applications

Modern MCTS: [Slides](slides/week3/MCTSintro.pdf)
- [Thinking Fast and Slow with Deep Learning and Tree Search](https://arxiv.org/pdf/1705.08439.pdf)
- [Mastering the game of Go without Human Knowledge](http://discovery.ucl.ac.uk/10045895/1/agz_unformatted_nature.pdf)
- [Mastering Chess and Shogi by Self-Play with a General Reinforcement Learning Algorithm](https://arxiv.org/abs/1712.01815)

Chemistry Application: [Slides](slides/week3/CSC2547_learning_to_plan_chemical_synthesis.pdf)
- [Learning to Plan Chemical Syntheses](https://arxiv.org/pdf/1708.04202.pdf)
- [Planning chemical syntheses with deep neural networks and symbolic AI](https://www.nature.com/articles/nature25978)

Robotics and planning applications: [Slides](slides/week3/robot.pdf)
- [QMDP-Net: Deep Learning for Planning under
Partial Observability](https://papers.nips.cc/paper/7055-qmdp-net-deep-learning-for-planning-under-partial-observability.pdf)
- [Integrating Algorithmic Planning and Deep Learning
for Partially Observable Navigation](https://arxiv.org/pdf/1807.06696.pdf)
- [End-to-end Interpretable Neural Motion Planner (2019)](http://openaccess.thecvf.com/content_CVPR_2019/papers/Zeng_End-To-End_Interpretable_Neural_Motion_Planner_CVPR_2019_paper.pdf)

Recent advances: [Slides 1](slides/week3/MMCTS.pdf) [Slides 2](slides/week3/MCTSnets.pdf)
 - [Memory-Augmented Monte Carlo Tree Search](https://webdocs.cs.ualberta.ca/~mmueller/ps/2018/Chenjun-Xiao-M-MCTS-aaai18-final.pdf)
 - [Learning to Search with MCTSnets](https://arxiv.org/pdf/1802.04697.pdf)

Related work:
  - [Combining Planning and Deep Reinforcement Learning in Tactical Decision Making for Autonomous Driving](https://arxiv.org/pdf/1905.02680.pdf)
  - [An investigation of model-free planning](https://arxiv.org/pdf/1901.03559v1.pdf)
  - [M-Walk: Learning to Walk over Graphs using Monte Carlo Tree Search](https://papers.nips.cc/paper/7912-m-walk-learning-to-walk-over-graphs-using-monte-carlo-tree-search.pdf)
  - [Deep Learning for Reward Design to Improve Monte Carlo Tree Search in ATARI Games](https://web.eecs.umich.edu/~baveja/Papers/IJCAIGSLL2016.pdf)
  - [MPC-Inspired Neural Network Policies for Sequential Decision Making](https://arxiv.org/pdf/1802.05803.pdf)
  
Other resources:
  - [Roger Grosse and Jimmy Ba's MCTS Slides](http://www.cs.toronto.edu/~rgrosse/courses/csc421_2019/slides/lec22.pdf)
  - [Alex Adam and Fartash Faghri's thinking fast and slow slides](https://duvenaud.github.io/learn-discrete/slides/Thinking-Fast-and-Slow-with-Deep-Learning-and-Tree-Search.pdf)
  - [Ferenc Huszar's blog post on Expert Iteration](https://www.inference.vc/alphago-zero-policy-improvement-and-vector-fields/)


***
### Week 4 - October 4th - Learning to SAT Solve and Prove Theorems

Learning to SAT Solve:
- [Machine Learning for Combinatorial Optimization: a Methodological Tour d'Horizon](https://arxiv.org/abs/1811.06128)
- [Learning a SAT Solver from Single-Bit Supervision](https://arxiv.org/pdf/1802.03685.pdf)
- [Learning to Solve NP-Complete Problems: A Graph Neural Network for Decision TSP](https://www.aaai.org/ojs/index.php/AAAI/article/view/4399/4277)
- [Guiding High-Performance SAT Solvers with Unsat-Core Predictions](https://arxiv.org/abs/1903.04671)

Theorem-proving benchmarks and environments: [Slides](slides/week4/holist.pdf)

 - [HOList: An Environment for Machine Learning of Higher-Order Theorem Proving](https://arxiv.org/abs/1904.03241)
 - [Learning to Prove Theorems via Interacting with Proof Assistants (2019)](http://proceedings.mlr.press/v97/yang19a/yang19a.pdf)
 - [GamePad: A Learning Environment for Theorem Proving (2018)](https://arxiv.org/abs/1806.00608)

Approaches to learning to efficiently prove theorems [Slides](slides/week4/Nogas.pdf): 
 - [Learning to Reason in Large Theories without Imitation (2019)](https://arxiv.org/abs/1905.10501)
 - [Automated Theorem Proving in Intuitionistic Propositional Logic by Deep Reinforcement Learning](https://arxiv.org/abs/1811.00796)
 - [Reinforcement Learning of Theorem Proving](https://papers.nips.cc/paper/8098-reinforcement-learning-of-theorem-proving.pdf)
 - [Deep Network Guided Proof Search](https://arxiv.org/pdf/1701.06972.pdf)
 - [Generating Correctness Proofs with Neural Networks](https://arxiv.org/pdf/1907.07794.pdf)
 - [Premise Selection for Theorem Proving by Deep Graph Embedding](https://arxiv.org/pdf/1709.09994.pdf)
 - [Graph Representations for Higher-Order Logic and Theorem Proving (2019)](https://arxiv.org/pdf/1905.10006.pdf)
 - [Curriculum Learning and Theorem Proving](http://aitp-conference.org/2019/abstract/paper%2013.pdf)
 - [DeepMath: Deep Sequence Models for Premise Selection](https://arxiv.org/pdf/1606.04442.pdf)

Relaxation-based approaches:
 - [End-to-End Differentiable Proving (2017)](http://papers.nips.cc/paper/6969-end-to-end-differentiable-proving.pdf)

 
 
***
### Week 5 - October 11th - Nested continuous optimization

Plain nested optimization:
  - [Generic Methods for Optimization-Based Modeling](http://proceedings.mlr.press/v22/domke12/domke12.pdf)
  - [Gradient-based Hyperparameter Optimization through Reversible Learning (2015)](https://arxiv.org/abs/1502.03492)
  - [How to train your MAML](https://openreview.net/pdf?id=HJGven05Y7)

Learning best-response functions:
  - [SMASH: One-Shot Model Architecture Search through HyperNetworks (2017)](https://arxiv.org/pdf/1708.05344.pdf)
  - [Stochastic Hyperparameter Optimization through Hypernetworks (2018)](https://arxiv.org/abs/1802.09419)
  - [Self-Tuning Networks: Bilevel Optimization of Hyperparameters using Structured Best-Response Functions (2019)](https://arxiv.org/abs/1903.03088)
  
Implicit function theorem:
  - [Reviving and Improving Recurrent Back-Propagation](https://arxiv.org/abs/1803.06396)
  - [Meta-Learning with Implicit Gradients (2019)](https://arxiv.org/pdf/1909.04630.pdf)
  - [Deep Equilibrium Models (2019)](https://arxiv.org/abs/1909.01377) can in principle be sped up by regularizing their dynamics to be easy to solve.

Game theory: [Slides](slides/week5/stackelberg.pdf)
  - [On Solving Minimax Optimization Locally: A Follow-the-ridge approach](https://openreview.net/pdf?id=Hkx7_1rKwS)
  - [Convergence of Learning Dynamics in Stackelberg Games (2019)](https://arxiv.org/pdf/1906.01217.pdf)

Other resources:
  - [Truncated Bi-Level Optimization (2014)](https://justindomke.wordpress.com/2014/02/03/truncated-bi-level-optimization/)
  - [Notes on iMAML: Meta-Learning with Implicit Gradients (2019)](https://www.inference.vc/notes-on-imaml-meta-learning-without-differentiating-through/)
  
  
***
### Week 6 - October 18th - Active Learning, POMDPs, and Bayesian Optimization:

Active learning: [Slides](slides/week6/nonmyopic.pdf)
 - [Bayesian Optimal Active Search and Surveying](https://pdfs.semanticscholar.org/9f39/d53abb641060e617e0964b0d2766a578e887.pdf)
 - [Efficient nonmyopic active search](https://www.cse.wustl.edu/~garnett/files/papers/jiang_et_al_icml_2017.pdf)

POMDPS: [Slides](slides/week6/POMCP.pdf)
  - [Monte-Carlo Planning in Large POMDPs](https://papers.nips.cc/paper/4031-monte-carlo-planning-in-large-pomdps.pdf)
  - [Deep Variational Reinforcement Learning for POMDPs (2018)](https://arxiv.org/pdf/1806.02426.pdf)
  - [Differentiable MPC for End-to-end Planning and Control (2018)](https://arxiv.org/pdf/1810.13400.pdf)

Curiosity and intrinsic motivation [Slides](slides/week6/Curiosity.pdf):
  - [Planning to Be Surprised: Optimal Bayesian Exploration in Dynamic Environments](http://people.idsia.ch/~sun/doc/agi11-explore.pdf)
  - [VIME: Variational Information Maximizing Exploration](https://arxiv.org/abs/1605.09674)
  - [Unifying Count-Based Exploration and Intrinsic Motivation (2016)](https://arxiv.org/abs/1606.01868)

Other resources:
  - [Slides on Efficient Nonmyopic Active Search by Zain Hasan and Daniel Hidru](https://duvenaud.github.io/learn-discrete/slides/Efficient_Nonmyopic_Active_Search.pdf)
  
  
***
### Week 7 - October 25th - Evolutionary Approaches and Direct Optimization
  
  - [Evolution Strategies as a Scalable Alternative to Reinforcement Learning](https://arxiv.org/abs/1703.03864) - replaces the exact gradient inside of REINFORCE with another call to REINFORCE.
  - [Evolvability ES: Scalable and Direct Optimization of Evolvability](https://arxiv.org/pdf/1907.06077.pdf)

Beam Search: [Slides](slides/week7/beam.pdf)
  - [Stochastic Beams and Where to Find Them: The Gumbel-Top-k Trick for Sampling Sequences Without Replacement](https://arxiv.org/abs/1903.06059)
  - [Sequence-to-Sequence Learning
as Beam-Search Optimization](https://arxiv.org/pdf/1606.02960.pdf)

Direct optimization: [Slides](slides/week7/direct.pdf)
  - [Direct Loss Minimization for Structured Prediction](https://papers.nips.cc/paper/4069-direct-loss-minimization-for-structured-prediction.pdf)
  - [Direct Optimization through argmax for Discrete Variational Auto-Encoder](https://arxiv.org/abs/1806.02867)
  - [Direct Policy Gradients: Direct Optimization of Policies in Discrete Action Spaces, 2019](https://arxiv.org/pdf/1906.06062.pdf)

Related work:
  - [Amortized Bethe Free Energy Minimization for
Learning MRFs](https://arxiv.org/pdf/1906.06399.pdf)



***
### Week 8 - November 1st - Learning to program

Search-based approaches:
   - [Learning Compositional Neural Programs with Recursive Tree Search and Planning (2019)](https://arxiv.org/abs/1905.12941)
   - [Neural-guided Deductive Search for Real-time Program Synthesis from Examples (2018)](https://www.microsoft.com/en-us/research/uploads/prod/2018/01/main-ml2search.pdf)
   - [Neural Program Synthesis By Self-Learning](https://openreview.net/pdf?id=Hkls_yBKDB)
 
Gradient-based approaches:
  - [Neural Turing Machines](https://arxiv.org/abs/1410.5401)
  - [Reinforcement Learning Neural Turing Machines](https://arxiv.org/abs/1505.00521) - tries training an NTM with REINFORCE, but it doesn't work very well.
  - [Programming with a Differentiable Forth Interpreter](https://arxiv.org/abs/1605.06640)
  
Learning a library of functions:
   - [Bootstrap Learning via Modular Concept Discovery](https://pdfs.semanticscholar.org/544e/6168446870dddb36ed4e613e42a8b5b8c59a.pdf)
   - [Library Learning for Neurally-Guided Bayesian Program Induction](https://papers.nips.cc/paper/8006-learning-libraries-of-subroutines-for-neurallyguided-bayesian-program-induction.pdf) 
   - [Program Synthesis and Semantic Parsing with Learned Code Idioms](https://arxiv.org/pdf/1906.10816.pdf)
 
 More related work: 
 - [Learning Programs: A Hierarchical Bayesian Approach](https://pdfs.semanticscholar.org/265a/3444d66d9a61dd03da10d1486bdadecdd851.pdf)
 - [Sampling for Bayesian Program Learning](http://web.mit.edu/ellisk/www/programSample.pdf)
 - [SPoC: Search-based Pseudocode to Code](https://www-cs.stanford.edu/~sumith/spoc/data/spoc_preprint.pdf)
 - [Neural Sketch Learning for Conditional Program Generation](https://openreview.net/pdf?id=HkfXMz-Ab)
 - [Robust Text-to-SQL Generation with Execution-Guided Decoding](https://arxiv.org/abs/1807.03100)
 - [Neural Guided Constraint Logic Programming for Program Synthesis](http://papers.nips.cc/paper/7445-neural-guided-constraint-logic-programming-for-program-synthesis)
 - [Learning Loop Invariants for Program Verification](http://papers.nips.cc/paper/8001-learning-loop-invariants-for-program-verification)
 - [Program Synthesis for Character-Level Language Modeling](http://openreview.net/pdf?id=ry_sjFqgx)

***
### Week 9 - November 8th - Meta-reasoning 

  - [What can Neural Networks Reason about? (2019)](https://openreview.net/pdf?id=rJxbJeHFPS)  [Slides](https://docs.google.com/presentation/d/1753e5WiT1uZqcGthz146Ij0I_03b9bSr2YBYAWeC3ZY/edit#slide=id.g6f6883bea9_0_0)
  - [Supervising strong learners by amplifying weak experts](https://arxiv.org/pdf/1810.08575.pdf) [Slides](slides/week9/metareasoning.pdf)
  - [Reasoning about reasoning by nested conditioning: Modeling theory of mind with probabilistic programs](https://www.sciencedirect.com/science/article/pii/S1389041713000387) [Slides](slides/week9/tom.pdf)
  - [Principles of Metalevel Control](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-152.pdf) PhD thesis of Nick Hay. [Slides](slides/week9/metalevel.pdf)
  
Other related work:
  - [Logical Induction](https://arxiv.org/abs/1609.03543)

  
***
### Week 10 - November 15th - Asymptotically Optimal Algorithms

Optimizing search strategies:
  - [Learning Transferable Graph Exploration (2019)](https://arxiv.org/pdf/1910.12980.pdf) [Slides](slides/week10/graph.pdf)
  - [Learning to Prune: Speeding up Repeated Computations (2019)](https://arxiv.org/pdf/1904.11875.pdf)  [Slides](https://docs.google.com/presentation/d/1YsCqFI_LAXwQrjKuyNAHo3IZjQKoCqmN0r26Izzlcu4/edit?usp=sharing) 
  - [Learning to Branch](https://arxiv.org/pdf/1803.10150.pdf) [Slides](slides/week10/learntobranch.pdf)
  
Optimizing agents: [Slides](https://docs.google.com/presentation/d/10S7SGnlJeRhkMvgmiJlDqDrzTbnURX8jRtbcjpjZurw/edit?usp=sharing)
  - [Optimal Ordered Problem Solver](https://arxiv.org/abs/cs/0207097)
  - [The Goedel Machine](http://people.idsia.ch/~juergen/goedelmachine.html)

AIXI: [Slides](slides/week10/AIXI.pdf)
  - [What is AIXI? — An Introduction to General Reinforcement Learning by Jan Leike](https://jan.leike.name/AIXI.html)
  - [Slides on AIXI from Marcus Hutter](http://www.hutter1.net/publ/suaigentle.pdf)
  - [A Monte Carlo AIXI Approximation (2009)](https://arxiv.org/abs/0909.0801)
  
Other related papers:
  - [Learning to Search in Branch-and-Bound Algorithms](https://papers.nips.cc/paper/5495-learning-to-search-in-branch-and-bound-algorithms.pdf)


 
***
### Week 11 - November 22nd - Project presentations part I

The last two weeks will be a series of 5-minute project presentations.


***
### Week 12 - November 29th - Project presentations part II


***
## Extra related reading

  - [Gradient Estimation Using Stochastic Computation Graphs](https://arxiv.org/abs/1506.05254)
  - [Backpropagation through the Void: Optimizing control variates for black-box gradient estimation](https://arxiv.org/abs/1711.00123) [code](https://github.com/duvenaud/relax)
  - The original [REINFORCE](http://www-anw.cs.umass.edu/~barto/courses/cs687/williams92simple.pdf) paper.
  - [The Concrete Distribution: A Continuous Relaxation of Discrete Random Variables](https://arxiv.org/abs/1611.00712) - a simple trick: turn all the step functions into sigmoids, and use backprop to get a biased gradient estimate.
  - [Categorical Reparameterization with Gumbel-Softmax](https://arxiv.org/abs/1611.01144) - the exact same idea as the Concrete distribution, published simultaneously.
  - [REBAR: Low-variance, unbiased gradient estimates for discrete latent variable models](https://arxiv.org/abs/1703.07370) - fixes the concrete estimator to make it unbiased, and also gives a way to tune the temperature automatically.
  - [A Visual Guide to Evolution Strategies](http://blog.otoro.net/2017/10/29/visual-evolution-strategies/)
  - [Evolution Strategies as a Scalable Alternative to Reinforcement Learning](https://arxiv.org/abs/1703.03864) - replaces the exact gradient inside of REINFORCE with another call to REINFORCE.
  - [Optimization by Variational Bounding](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-65.pdf)
  - [Natural Evolution Strategies](http://www.jmlr.org/papers/volume15/wierstra14a/wierstra14a.pdf)
  - [On the Relationship Between the OpenAI Evolution Strategy and Stochastic Gradient Descent](https://arxiv.org/pdf/1712.06564.pdf) - shows that ES might work in high dimensions because most of the dimensions don't usually matter.
  - [The Generalized Reparameterization Gradient](https://arxiv.org/abs/1610.02287) - shows how to partially reparameterize some otherwise un-reparameterizable distributions.
  - [Developing Bug-Free Machine Learning Systems With Formal Mathematics](https://arxiv.org/pdf/1706.08605.pdf) - shows how to use formal tools to verify that a gradient estimator is unbiased.
  - [Learning Hard Alignments with Variational Inference](https://arxiv.org/pdf/1705.05524.pdf) - in machine translation, the alignment between input and output words can be treated as a discrete latent variable.
  - [Dynamic Planning Networks](https://arxiv.org/pdf/1812.11240.pdf)
  - [A Model to Search for Synthesizable Molecules](https://arxiv.org/pdf/1906.05221.pdf)
  - [Model-Based Planning in Discrete Action Spaces](https://arxiv.org/abs/1705.07177) - "it is in fact possible to effectively perform planning via backprop in discrete action spaces"
  - [Generating and designing DNA with deep generative models](https://arxiv.org/abs/1712.06148)
  - [Emergence of Grounded Compositional Language in Multi-Agent Populations](https://arxiv.org/abs/1703.04908)  
  - [The Case for Learned Index Structures](https://arxiv.org/abs/1712.01208)
  - [Path Integral Networks: End-to-End Differentiable Optimal Control (2017)](https://arxiv.org/pdf/1706.09597.pdf)
  - [Learning to Search Better than Your Teacher](https://arxiv.org/pdf/1502.02206.pdf)
  - [GLASSES: Relieving The Myopia Of Bayesian Optimisation](http://proceedings.mlr.press/v51/gonzalez16b.pdf)
