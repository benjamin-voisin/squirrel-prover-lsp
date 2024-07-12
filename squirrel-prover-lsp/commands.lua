return {
	{
		name = "Proof",
		type = "Command",
		description = [[
Enter proof mode with a unique subgoal corresponding to the previous unproved lemma.
		]],
	},
	{
		name = "Qed",
		type = "Command",
		description = [[
Close the current proof, if it’s completed (i.e. has no remaining unclosed goal).
		]],
	},
	{
		name = "Abort",
		type = "Command",
		description = [[
Abort the current proof.
		]],
	},
	{
		name = "undo",
		type = "Command",
		description = [[
undo n undoes the n (default 1) last sentence(s). Concretely, the tactic restores the n\(^{th}\) previous prover state as the current one.
In general undo commands are not used in Squirrel scripts but used for Proof-General navigation.
		]],
	},
	{
		name = "Reset",
		type = "Command",
		description = [[
Reset the prover state. This command can be undone with undo since it does not clear the prover state history.
		]],
	},
	{
		name = "include",
		type = "Command",
		description = [[
Attempt to find file file.sp, first in the same directory as the current Squirrel file, and then in the theories directory.
If you install squirrel (with make install) and not running it from root directory of its sources, the theories directory is located in ~/.local/bin.
		]],
	},
	{
		name = "set",
		type = "Command",
		description = [[
Set any squirrel option using its ident:
		]],
	},
	{
		name = "print",
		type = "Command",
		description = [[
Show the definition of a given ident if it is a lemma, function, name, macro or system. print without idendifier shows the current system.
		]],
	},
	{
		name = "search",
		type = "Command",
		description = [[
		]],
	},
	{
		name = "hint",
		type = "Command",
		description = [[
Add a rewriting rule from the lemma ident to the user-defined rewriting database. The lemma should establish a local formula consisting of a universally quantified conditional equality. In other words, it should essentially be of the form forall binders, phi_1 =&gt; ... =&gt; phi_n =&gt; u = v.
The goal will be used to rewrite occurrences of u into the corresponding occurrences of v, assuming the conditions phi_1, ..., phi_n reduce to true (using Reduction).
		]],
	},
	{
		name = "prof",
		type = "Command",
		description = [[
Print profiling information.
		]],
	},
}
