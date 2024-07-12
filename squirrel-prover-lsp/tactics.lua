return {
	{
		name = "auto",
		type = "Tactic",
		description = [[
Attempt to automatically prove a goal using the hypotheses.
The tactic uses the reduction engine with the provided flags (defaults to rw,beta,proj).
Moreover, for local goals, the tactic relies on basic propositional reasoning, rewriting simplications, and both constraints and congruence.
		]],
	},
	{
		name = "autosimpl",
		type = "Tactic",
		description = [[
Simplify a goal, without closing it.
The tactic uses the reduction engine with the flags rw,beta,proj.
When the conclusion of the goal is a conjunction, it splits the goal into several sub-goals, automatically closing only the trivial goals proved by true and assump.
When the conclusion of the goal is a global formula which only contains a local formula, the goal is then turned into a local formula. Otherwise the tactic does nothing.
		]],
	},
	{
		name = "simpl",
		type = "Tactic",
		description = [[
Simplify a goal and its hypotheses. This tactic always succeeds, replacing the initial goal with a single simplified goal.
The tactic uses the reduction engine with the provided flags (defaults to rw,beta,proj).
When the goal is a conjunction, the tactic will attempt to automatically prove some conjuncts (using auto) and will then return a simplified sub-goal without these conjuncts. In the degenerate case where no conjunct remains, the goal will be true.
When the conclusion of the goal is an equivalence, the tactic will automatically perform fa when at most one of the remaining sub-terms is non-deducible. It may thus remove a deducible item from the equivalence, or replace an item &lt;u,v&gt; with u if it determines that v is deducible.
		]],
	},
	{
		name = "by",
		type = "Tactic",
		description = [[
Fail unless the tactic closes the goal.
		]],
	},
	{
		name = "nosimpl",
		type = "Tactic",
		description = [[
Call the given tactic without the implicit use of simplifications. This can be useful to understand what’s going on step by step. This is also necessary in rare occasions where simplifications are actually undesirable to complete the proof.
		]],
	},
	{
		name = "try",
		type = "Tactic",
		description = [[
Try to apply the given tactic. If it fails, succeed with the sub-goal left unchanged.
		]],
	},
	{
		name = "repeat",
		type = "Tactic",
		description = [[
Apply the given tactic, and recursively apply it again on the generated sub-goals, until it fails.
		]],
	},
	{
		name = "tactic",
		type = "Tactic",
		description = [[
tactic =&gt; intro_pat_list is equivalent to tactic; intro intro_pat_list
		]],
	},
	{
		name = "admit",
		type = "Tactic",
		description = [[
Admit the current goal, or admit the element at position position when the goal is an equivalence.
		]],
	},
	{
		name = "assumption",
		type = "Tactic",
		description = [[
		]],
	},
	{
		name = "case",
		type = "Tactic",
		description = [[
Perform a case analysis over the given argument:
		]],
	},
	{
		name = "induction",
		type = "Tactic",
		description = [[
Apply the induction scheme to the conclusion. There are several behaviours depending on the type of the current goal and whether an argument is given.
For a reachability goal, if no argument is specified, the conclusion must start with a universal quantification over a well-founded type and the induction is performed over the first quantified variable. If a term is manually specified, the goal is first generalized (see generalize) w.r.t. those variables and only then is the induction applied.
For an equivalence goal, an argument must always be specified, and,
The weak induction variant is in fact the most widely used tactic in current Squirrel examples to prove the observational equivalence of a protocol.
		]],
	},
	{
		name = "dependent",
		type = "Tactic",
		description = [[
Apply the induction scheme to the conclusion. If no argument is specified, the conclusion must be a universal quantification over a well-founded type. Alternatively, a term of a well-founded type can be given as argument, in which case the goal is first generalized in the dependent variant (see generalize dependent) before proceeding with the induction.
This tactic always uses a strong induction principle (as opposed to the induction tactic, which performs a weak induction when the conclusion is an equivalences).
		]],
	},
	{
		name = "destruct",
		type = "Tactic",
		description = [[
Destruct a hypothesis based on its top-most connective (existential quantification, disjunction or conjunction), applying the simple introduction pattern simpl_ip to it.
simpl_ip defaults to ? if no pattern is provided by the user.
		]],
	},
	{
		name = "exists",
		type = "Tactic",
		description = [[
exists term1 ... termn uses the terms term1 ... termn as witnesses to prove an existentially quantified conclusion.
For example, exists t transforms the conclusion of a goal (exists x, phi) into (phi{x -&gt; t}).
		]],
	},
	{
		name = "generalize",
		type = "Tactic",
		description = [[
generalize term_pat looks for an instance term of term_pat in the goal. Then, it replaces all occurrences of term by a fresh universally quantified variable (automatically named, or variable if provided).
		]],
	},
	{
		name = "generalize",
		type = "Tactic",
		description = [[
Same as generalize, but also generalize in the proof context. All hypotheses in which generalization occurred are pushed back into the conclusion before the newly added quantified variables.
		]],
	},
	{
		name = "have",
		type = "Tactic",
		description = [[
have have_ip : F introduces the new hypothesis F, which can be a term or a global_formula. The new hypothesis is processed by have_ip (see below). A new sub-goal requiring to prove F is created.
If have_ip is the introduction pattern s_itempre simpl_ip s_itempost then:
It there are mutliple pre or post simplification items, they are applied in order.
		]],
	},
	{
		name = "assert",
		type = "Tactic",
		description = [[
This is an alternative syntax for have simpl_ip : term, where simpl_ip defaults to ?.
		]],
	},
	{
		name = "have",
		type = "Tactic",
		description = [[
have have_ip := proof_term resolves proof_term — requiring that the term unification enviroment is closed — and processes the resulting formula using introduction pattern have_ip.
		]],
	},
	{
		name = "apply",
		type = "Tactic",
		description = [[
Backward reasoning tactic. First, proof_term is resolved as a formula Fpt — without closing the term unification environment. Then, it is unified with the conclusion, and finally the term unification environment is closed.
If the unification of Fpt with the conclusion fails, the tactic introduces the top-most element of Fpt as described below, and then tries again to unify with the conclusion:
		]],
	},
	{
		name = "apply",
		type = "Tactic",
		description = [[
Forward reasoning variant of apply, which unifies the premisses of proof_term against the conclusion of hypothesis_id, replacing hypothesis_id content with proof_term’s conclusion.
For instance, if H1:A=&gt;B and H2:A, then apply H1 in H2 replaces H2:A with H2:B.
		]],
	},
	{
		name = "rewrite",
		type = "Tactic",
		description = [[
Apply a sequence of rewriting and simplification items to the rewrite target, which is:
Rewrite items are applied as follows:
		]],
	},
	{
		name = "id",
		type = "Tactic",
		description = [[
The identity tactic, which does nothing. Sometimes useful when using tactic combinators.
		]],
	},
	{
		name = "intro",
		type = "Tactic",
		description = [[
Introduce the top-most assumptions and universally quantified variables of the conclusion as specified by the given introduction patterns.
		]],
	},
	{
		name = "clear",
		type = "Tactic",
		description = [[
Drop the specified hypotheses.
		]],
	},
	{
		name = "reduce",
		type = "Tactic",
		description = [[
Reduce all terms in a goal, working on both hypotheses and conclusion.
This tactic always succeeds, replacing the initial goal with a unique sub-goal (which may be identical to the initial one).
The tactic uses the reduction engine with the provided flags (defaults to rw,beta,proj).
		]],
	},
	{
		name = "remember",
		type = "Tactic",
		description = [[
remember behaves as generalize, except that it adds as a hypothesis the equality between the generalized term and the new variable.
		]],
	},
	{
		name = "revert",
		type = "Tactic",
		description = [[
Remove the hypotheses from the proof context, and add them back into the conclusion of the goal.
For example, running revert H on the judgement H : F, Γ ⊢ conc yields Γ ⊢ F =&gt; conc.
		]],
	},
	{
		name = "left",
		type = "Tactic",
		description = [[
Reduce a goal with a disjunction conclusion into the goal where the conclusion has been replaced with the first disjunct. That is, left turns Γ ⊢ F || G into Γ ⊢ F.
		]],
	},
	{
		name = "right",
		type = "Tactic",
		description = [[
Reduce a goal with a disjunction conclusion into the goal where the conclusion has been replaced with the second disjunct. That is, right turns Γ ⊢ F || G into Γ ⊢ G.
		]],
	},
	{
		name = "split",
		type = "Tactic",
		description = [[
Split a conjunction goal, creating one sub-goal per conjunct. For example, split replaces the goal ⊢ F &amp;&amp; G &amp;&amp; H with the three goals ⊢ F, ⊢ G and ⊢ H.
		]],
	},
	{
		name = "use",
		type = "Tactic",
		description = [[
Instantiate a lemma or hypothesis using the provided arguments (if any). An introduction pattern can also be specified to handle the new hypothesis.
		]],
	},
	{
		name = "localize",
		type = "Tactic",
		description = [[
Change a global hypothesis containing a reachability formula [term] to a local hypothesis term, and applies the given simple introduction pattern simpl_ip to the new hypothesis.
For example, the tactic turns [F],G ⊢ H into F,G ⊢ H.
		]],
	},
	{
		name = "constraints",
		type = "Tactic",
		description = [[
Attempt to conclude by automated reasoning on trace literals. Literals are collected from hypotheses, both local and global, after the destruction of conjunctions (but no case analysis is performed to handle conjunctive hypotheses). If the conclusion is a trace literal then it is taken into account as well.
		]],
	},
	{
		name = "depends",
		type = "Tactic",
		description = [[
If the second action depends on the first action, and if the second action happens, then add the corresponding timestamp inequality.
		]],
	},
	{
		name = "expand",
		type = "Tactic",
		description = [[
Expand all occurences of the given macros in both the conclusion and proof-context, either fully specified with an action or simply a type of macro.
		]],
	},
	{
		name = "expandall",
		type = "Tactic",
		description = [[
Expand all possible macros in the current proof-context and conclusion.
		]],
	},
	{
		name = "fa",
		type = "Tactic",
		description = [[
Apply the function application rule, simplifying the goal by removing the head function symbol, as follows:
In the global goal setting, the target can be selected with its position, or using a fa_arg, which behave as follow:
		]],
	},
	{
		name = "namelength",
		type = "Tactic",
		description = [[
Adds the fact that two names have the same length. The two arguments must the indeed be a name.
		]],
	},
	{
		name = "fresh",
		type = "Tactic",
		description = [[
Fresh is an information-theoretically sound tactic exploiting the fact that names represent independent random samplings. This can be exploited in two ways: i) to remove a fresh name from an equivalence; or ii) to obtain that a term has a negligible probability of being equal to a fresh name.
In a local goal with conclusion phi, the tactic may be called on a hypothesis of the form t=n for some name n sampled over a type with tag large. For such a sampling, if term t is computed without knowing n, this equality can only hold with negligible probability. We may thus assume that n occurs in t. Accordingly, the tactic turns the conclusion into the formula occur(n,t,none) =&gt; phi (see the definition of the occurrence formula).
If one can then prove that n cannot occur in t, that is that occur(n,t,none) is false, that new conclusion trivially holds. If occur(n,t,none) is trivially false, e.g. if t is a macro-free term without n as a subterm, the goal will be directly closed.
In an equivalence goal, on the other hand, the tactic must be applied to a bi-frame element i of the form diff(nL,nR), where nL, nR are names sampled over the same type. Since samplings are independent, the two names are indistinguishable, unless some information on them is revealed by the rest of the bi-frame. Note that, contrary to the local case, that property holds even if the type is not large.
If we let bf denote the bi-frame, the :g:ì`th bi-frame element is replaced by the tactic with
We specify through the occurrence formula that the only possible occurrence of nL is in fact the one we are currently looking at.
In all cases, the precise_ts makes the tactic use precise_occur instead of occur.
Latest formal Squirrel description: [BKL23] (Appendix F).
		]],
	},
	{
		name = "help",
		type = "Tactic",
		description = [[
When used without arguments, display all available commands. The tactic can  also display the details for a given tactic name, or display or more concise list. It is a tactic and not a command, and as such can only be used inside proofs.
		]],
	},
	{
		name = "lemmas",
		type = "Tactic",
		description = [[
Print all axioms and proved lemmas. This is useful to know which lemmas can be used through the use or apply tactics.
		]],
	},
	{
		name = "show",
		type = "Tactic",
		description = [[
Print the messages given as argument. Can be used to print the values matching a pattern.
		]],
	},
	{
		name = "true",
		type = "TraceTactic",
		description = [[
Close a goal when the conclusion is (syntactically) true.
		]],
	},
	{
		name = "congruence",
		type = "TraceTactic",
		description = [[
Attempt to conclude by automated reasoning on message (dis)-equalities. Equalities and disequalities are collected from hypotheses, both local and global, after the destruction of conjunctions (but no case analysis is performed to handle conjunctive hypotheses). If the conclusion is a message (dis)-equality then it is taken into account as well.
		]],
	},
	{
		name = "const",
		type = "TraceTactic",
		description = [[
Add the const tag to a variable.
The variable must be of a finite and fixed (η-independent) type, and must not appear in any global hypothesis (some global hypotheses may be localised (see localize) if necessary.
		]],
	},
	{
		name = "eqnames",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "eqtrace",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "executable",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "project",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "rewrite",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "slowsmt",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "smt",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "subst",
		type = "TraceTactic",
		description = [[
		]],
	},
	{
		name = "cdh",
		type = "TraceTactic",
		description = [[
This tactic applies the Computational Diffie-Hellman assumption (see e.g. [OP01]), stating for a generator \(g\) and randomly sampled exponents \(a\) and \(b\), it is computationally hard to compute \(g^{ab}\) when only \(g^a\) and \(g^b\) are known.
A cdh, ddh or gdh group declaration must have been specified (the DDH or GDH assumptions indeed both imply the CDH assumption). For a group with generator g and exponentiation ^, the tactic cdh M, g may be called in a local goal on a message equality hypothesis M of the form t=g^{a b}. Following the CDH assumption, M can only hold if t accesses a or b in some way other than g^a and g^b.
Therefore, the tactic will replace in the current goal the conclusion phi with occur(a,t,g^a) || occur(b,t,g^b) =&gt; phi (see the definition of the occurrence formula). If both occurrence formulas are trivially false, then the goal is closed automatically.
A formal description of this tactic has not yet been given in any published work.
		]],
	},
	{
		name = "gdh",
		type = "TraceTactic",
		description = [[
This tactic applies the Gap Diffie-Hellman assumption (see e.g. [OP01]), which is similar to CDH over \(g^a\) and \(g^b\), except that the attacker is additionally allowed to access an oracle testing equality to \(g^{ab}\). It also includes the Square-GDH variant (see [FS11]), which is equivalent to the GDH assumption for prime order groups, where the attacker can also test equality to \(g^{aa}\) and \(g^{bb}\).
A gdh group declaration must have been specified.
The behaviour of this tactic is similar to cdh, expect that the current goal’s conclusion phi is replaced with a more permissive formula occur((a,b),t,(g^a,g^b,_=g^(ab), _=g^(bb), _=g^(aa)) =&gt; phi (see the definition of the occurrence formula).
A formal description of this tactic has not yet been given in any published work.
		]],
	},
	{
		name = "collision",
		type = "TraceTactic",
		description = [[
Requires a hash function declaration.
This tactic applies the known-key collision resistance assumption (see e.g. the cr2-kk assumption from [GB96]).
It collects all equalities between hashes occurring at top-level in message hypotheses, that is all hypotheses of the form h(u,k)=h(v,k), and for each such hypothesis adds as new hypothesis u=v.
As this implements the known-key variant of the collision resistance assumption, no side condition is checked on the hash key.
Latest formal Squirrel description: [BKL23] (only as an example).
		]],
	},
	{
		name = "euf",
		type = "TraceTactic",
		description = [[
Requires either a hash function or a signature scheme declaration.
This tactic applies the EUF-CMA axiom in a local goal, either for keyed-hashes or signatures. (see e.g. [GB96])
For a hash function h(x,k), one may call euf M over a message equality M of the form t = h(m,k) or h(m,k)=t. EUF-CMA then states that, provided the key k is always used in correct position, M can only hold if computing t requires already knowing the hash of m. Accordingly, the tactic creates a first new sub-goal asking to prove that the key is only used in correct position, i.e. a sub-goal with conclusion not(occur(k,goal,h(_,k)) (see the definition of the occurrence formula). The tactic then collects all possible occurrence of a honest hash h(u,k) inside t, and for each of them, creates a sub-goal with the original conclusion and a new hypothesis stating that m=u. Moreover, if the occurrence is under a macro, additional new hypotheses will state that these macros must be taken at an earlier timestamp than t.
For a signature function sign(x,r,k), public key pk(k) and verification function check(s,m,pub), euf must be called on a hypothesis of the form check(s,m,pk(k)). The behaviour is then similar to the hash case: honest signatures that may occur in s will be collected, and m must be equal to one of the honestly signed messages. A sub-goal for each possible honest signing case is created, as well as a sub-goal specifying that the key is correctly used, i.e. with conclusion not(occur(k,goal,sign(_,k), pk(k)).
Latest formal Squirrel description: [BKL23].
		]],
	},
	{
		name = "intctxt",
		type = "TraceTactic",
		description = [[
This tactic applies the INT-CTXT assumption (see e.g. [BN00]) in a local goal.
It requires the declaration of a symmetric encryption scheme.
It can be applied to a hypothesis either of the form dec(c,k)&lt;&gt;fail or dec(c,k) = t (in the latter case, it will generate as an additional proof obligation that t &lt;&gt; fail).
The INT-CTXT assumption then states that, provided the key k is correctly used, such a decryption may only succeed if c was produced by an honest encryption.
In both cases, Squirrel will thus collect all honest encryptions made with key k, and produce a subogal corresponding to each case where c is equal to one of those honest encryptions.
The key k must only be used in key position, so a sub-goal asking to prove that not(occur(k,c,(enc(_,_,k),dec(_,k))) is created when it is not trivially true (see the definition of the occurrence formula).
In addition, a goal asking to prove that all randomness used for encryption are disjoint and fresh (when it is not trivially true).
Latest formal Squirrel description: [BDJ+21].
		]],
	},
	{
		name = "byequiv",
		type = "EquivTactic",
		description = [[
Transform a global judgement ⊢ [F] into a local judgement ⊢ F.
		]],
	},
	{
		name = "constseq",
		type = "EquivTactic",
		description = [[
Simplify a sequence at the given position when it only contains a finite number of possible values v_1,…, v_i depending on the value of the sequence variable.
Given a sequence over a variable of a given type, the arguments passed must be of the form (fun_1 v_1) ... (fun_i v_i), where all the fun functions must be binders over the sequence type and must return a boolean.  This tactic creates two sub-goals asking to prove the two required properties of the arguments and sequence:
		]],
	},
	{
		name = "enrich",
		type = "EquivTactic",
		description = [[
		]],
	},
	{
		name = "memseq",
		type = "EquivTactic",
		description = [[
		]],
	},
	{
		name = "refl",
		type = "EquivTactic",
		description = [[
		]],
	},
	{
		name = "sym",
		type = "EquivTactic",
		description = [[
		]],
	},
	{
		name = "trans",
		type = "EquivTactic",
		description = [[
		]],
	},
	{
		name = "splitseq",
		type = "EquivTactic",
		description = [[
Split a sequence according to some boolean test, replacing the sequence with two subsequences.
The function passed as argument must be take as argument a variable of the same type as the sequence, and must return a boolean.
		]],
	},
	{
		name = "cs",
		type = "EquivTactic",
		description = [[
Performs case study on conditionals inside an equivalence.
Without a specific target, cs phi will project all conditionals on phi in the equivalence. With a specific target, cs phi in i will only project conditionals in the i-th item of the equivalence.
		]],
	},
	{
		name = "deduce",
		type = "EquivTactic",
		description = [[
deduce i removes the i’th element from the bi-frame when it can be computed from the rest of the bi-frame. Without any argument, it will remove the first element that can be dropped, if it exists.
Here, the fact that the bi-frame element u can be computed from the other bi-frame elements x,y,... means that there exists a context C made of function applications such that u is equal to C[x,y,..].
This relies on some heuristical automated reasoning. Some properties on macros are automatically exploited, e.g. that for any timestamp t, frame&#64;pred(t) allows to deduce input&#64;t, all frame&#64;t' for t' &lt; pred(t), as well as the output&#64;t' for whenever exec&#64;t' is true.
		]],
	},
	{
		name = "diffeq",
		type = "EquivTactic",
		description = [[
Close a reflexive goal up to equality. That is, if all diff-term whitin the global goal’s conclusion always evaluate to the same value in all systems, the equivalence holds. For each diff-term, a dedicated sub-goal is created.
		]],
	},
	{
		name = "cca1",
		type = "EquivTactic",
		description = [[
This tactic applies the IND-CCA assumption (see e.g. [BN00]) in a global goal.
It requires the declaration of a symmetric encryption or asymmetric encryption scheme.
The tactic may be called over a bi-frame element containing a term of the form C[enc(n, r, m)], where
The tactic will then replace the encryption occurrence by an encryption of a bitstring of zeroes of the correct length, yielding C[enc(zeroes(len(n)), r, pk(k))].
In addition, the tactic creates a sub-goal asking to prove that all occurrences of the key and encryptions are correct. Notably, one must prove that occur(k,bi-frame,(enc(_,_,k), dec(_,k)) (see the definition of the occurrence formula) is false (or occur(k,bi-frame,(pk(k), dec(_,k))) for the asymmetric case).
In addition, in the asymmetric case, a sub-goal is created to prove the freshness of the random used in the encryption, with the conclusion occur(r,bi-frame,enc(n,r,m)).
In the symmetric case, an additional sub-goal is created ensuring that all encryptions are made with distinct fresh randoms (and not just the the encryption we are looking at).
Latest formal Squirrel description:[BKL23].
		]],
	},
	{
		name = "ddh",
		type = "EquivTactic",
		description = [[
This tactic applies the Decisional Diffie-Helman assumption (see e.g. [OP01]), stating that for a generator \(g\), and randomly sampled exponents \(a\), \(b\), \(c\), it is computationally hard to distinguish \(g^{ab}\) from \(g^c\), when only \(g^a\) and \(g^b\) are known.
A ddh group declaration must have been specified.
When calling, ddh g,a,b,k, the goal must contain only diff terms of the form diff(g^(ab),g^(c))). The tactic will close the goal if the formula occur((a,b,c),goal,(g^a,g^b,diff(g^(ab),c))) instantly reduces to false (see the definition of the occurrence formula).
Latest formal Squirrel description: [BDJ+21].
		]],
	},
	{
		name = "enckp",
		type = "EquivTactic",
		description = [[
ENC-KP assumes that a symmetric or an asymmetric encryption scheme does not leak any information about the public (or secret) key used to encrypt the plaintext. It is based on the IK-CPA notion of [BBDP01].
The tactic can be called on a bi-frame element containing a term of the form C[enc(n, r, m)], where
When m is the diff of two keys, the diff is simplified by keeping only the key on the left. When m is just one key, a new key with which it is replaced can be specified as arugment.
The tactic expects as arguments:
To apply the enckp tactic, the key k must be such that occur(k,bi-frame,(enc(_,_,k), dec(_,k)) (see the definition of the occurrence formula) is trivially false. (or occur(k,bi-frame,(pk(k), dec(_,k))) for the asymmetric case).
When it is not trivially true, a sub-goal is created, asking to prove the freshness of the random used in the encryption, with the conclusion occur(r,bi-frame,enc(n,r,m)).
In the symmetric case, an additional check is performed ensuring that all encryptions are made with distinct fresh randoms (and not just the encryption we are looking at).
Latest formal Squirrel description:[BDJ+21].
		]],
	},
	{
		name = "prf",
		type = "EquivTactic",
		description = [[
This tactic applies the PRF assumption (see e.g. [GB96]).
It requires a hash function declaration.
This tactic applied to a bi-frame element containg a hash application h(m,k) tries to replace the hash value with a fresh name, under the condition that m has never been hashed before, and that the key k is correctly used.
Formally, when called over a bi-frame element i : C[h(m,k)], the tactic replaces in the current goal the element with i : C[nPRF] where nPRF is a newly generated unique name. It in addition produces sub-goals requiring to prove the side conditions described above. It notably produces a goal asking to prove that the key is only used in key position, i.e. that occur(k,bi-frame,h(_,k)) is false (see the definition of the occurrence formula). In addition, it creates for each occurrence of h(t,k) within the bi-frame (that may occur under macros) a sub-goal asking to prove that t &lt;&gt; m, that is, that m was never hashed before. Such sub-goals may need to be created separately for both projections of the bi-frame.
If multiple occurrences of hashes occur in the bi-frame element, the first one is targeted by default. Calling the tactic with an optional term_pat allows to target a specific hash occurrence.
Latest formal Squirrel description: [BKL23].
		]],
	},
	{
		name = "xor",
		type = "EquivTactic",
		description = [[
This tactic applies the unconditionally sound one time pad property of the xor operation.
The tactic applied to a bi-frame element of the form i : C[n XOR t] will replace the XOR term by
This new term then allows us to drop the old term only if n and t do have the same length (as the one time pad does not work otherwise), and if this is the only occurrence of n in the bi-frame.
When multiple XOR occur in the bi-frame, one can specify one or two optional term patterns, to specify in any order the name n or the full XOR-ed term n XOR t to target.
Latest formal Squirrel description: [BDJ+21].
		]],
	},
}
