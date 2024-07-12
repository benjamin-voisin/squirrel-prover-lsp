return {
	{
		name = "name",
		type = "Declaration",
		description = [[
A name declaration name name_id : typei -&gt;? types introduces a new name symbol name_id optionally indexed by typei and sampling values of type types.
Whenever a name n is defined, a corresponding namelength axiom is declared as:
It states that all names have the same length, given by a constant.
It is required that the indexing type typei is a finite type, but there are no restrictions over the sampling type types.
The sampling distribution used over the sampling type types is usually arbitrary — though it can be restricted using type tags.
		]],
	},
	{
		name = "abstract",
		type = "Declaration",
		description = [[
Declares a deterministic and polynomial-time computable abstract function of type type and named fun_id.
The function can be polymorphic through the optional tvar_params type variable parameters.
		]],
	},
	{
		name = "op",
		type = "Declaration",
		description = [[
Declares an operator named op_id, with arguments binders and returning term.
The return type type can be provided, or left to be automatically inferred by Squirrel.
Operator declarations can be polymorphic through the optional tvar_params type variable parameters.
An operator declaration fails if Squirrel cannot syntactically check that its body represents a deterministic value.
		]],
	},
	{
		name = "hash",
		type = "Declaration",
		description = [[
declares a keyed hash function with types tyk for keys, tym for messages and tyh for hash digests. It is assumed to satisfy the PRF and known-key collision resistance assumptions.
Enables the use of prf, euf and collision.
		]],
	},
	{
		name = "signature",
		type = "Declaration",
		description = [[
declares a signature scheme with types tym for messages to be signed, tysig for signatures, tysk for secret signing keys and typk for public verification keys. It is assumed unforgeable against chosen message attacks (EUF-CMA) and satisfying the equation ver(sig(m,sk),m,pk(sk)) = true.
Enables the use of euf.
		]],
	},
	{
		name = "aenc",
		type = "Declaration",
		description = [[
declares an asymmetric encryption scheme with types typtxt for plain-texts, tyctxt for cipher-texts, tyrnd for encryption randomness, tysk for secret decryption keys and typk for public encryption keys. It is assumed IND-CCA1 and ENC-KP, and satisfying the equation dec(enc(m,pk(sk)),sk) = m.
Enables the use of cca1 and enckp.
		]],
	},
	{
		name = "senc",
		type = "Declaration",
		description = [[
declares a symmetric encryption scheme with types typtxt for plain-texts, tyctxt for cipher-texts, tyrnd for encryption randomness and tyk for keys. It is assumed IND-CPA and INT-CTXT, and satisfying the equation dec(enc(m,sk),sk) = m.
Enables the use of cca1, intctxt and enckp.
		]],
	},
	{
		name = "ddh",
		type = "Declaration",
		description = [[
The group declaration:
declares a group with generator g, exponentation (^) and exponent multiplication ( ** ).  The group is assumed to satisfy the DDH assumption when declared with ddh, the CDH assumption with cdh, and the Gap-DH assumption with g:gdh.
Enables the use of cdh, gdh and ddh.
		]],
	},
	{
		name = "channel",
		type = "Declaration",
		description = [[
Declares a channel named channel_id.
		]],
	},
	{
		name = "mutable",
		type = "Declaration",
		description = [[
Declares a memory cell named state_id indexed by arguments binders and initialized to term. Due to technical limitations, Squirrel currently only supports binders of finite type.
The return type type can be provided, or left to be automatically inferred by Squirrel.
		]],
	},
	{
		name = "process",
		type = "Declaration",
		description = [[
Declares a new process named process_id with arguments binders and body process.
		]],
	},
	{
		name = "system",
		type = "Declaration",
		description = [[
Declare a bi-system whose actions are obtained by translating process, which may use bi-terms. The obtained single systems can be referred to as system_id/left and system_id/right. The left (resp. right) single system corresponds to the process obtained by taking the left (resp. right) projections of all bi-terms appearing in process.
The system name system_id defaults to default when no identifier is specified.
		]],
	},
	{
		name = "local",
		type = "Declaration",
		description = [[
Declares a new local lemma or axiom.
		]],
	},
	{
		name = "global",
		type = "Declaration",
		description = [[
Declares a new global lemma or axiom.
		]],
	},
}
