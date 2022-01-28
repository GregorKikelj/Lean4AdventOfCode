import Solution01

def main :=
  solvePart1


def sumList : List Int -> Int
  | [] => 0
  | (h::t) => h + sumList t

theorem sumXp0 :∀n: Nat, n+0=n := by
  intro n
  simp
theorem mulKeepsEqL : ∀ a b c : Nat, a = b → c  * a = c * b:= by
  intro a b c nm
  rw [nm]
theorem mulKeepsEqR : ∀ a b c : Nat, a = b → a * c = b * c := by
  intro a b c nm
  rw [nm]
theorem rmul2 :∀ a b : Nat, a=b → 2*a=2*b := by
  intro a b p
  simp [*] at *

#check Nat.mul_pos
theorem mulLeftCancel :∀ a b c : Nat, a>0 → a*b=a*c → b=c := by
  intro a b c ha habc
  revert b
  induction c with
  |zero => 
    intros b p
    simp at *
    have opt:= Nat.eq_zero_or_pos b
    apply Or.elim opt
    . intro p
      exact p
    . intro hb
      have contra:= Nat.mul_pos ha hb 
      rw [p] at contra
      simp at contra
  |succ c ih=> 
    intros b
    cases b with
    | zero => 
      simp at *
      intro p
      clear ih
      have succCNeZero := Nat.succ_ne_zero c
      have q:= Nat.eq_zero_or_pos (Nat.succ c)
      apply Or.elim q
      . intro qq
        simp at *
      . intro qq
        have pm:= Nat.mul_pos ha qq
        rw [← p] at pm
        simp at *
    | succ b => 
      intro p
      rw [Nat.succ_eq_add_one, Nat.succ_eq_add_one] at *
      rw [Nat.mul_add, Nat.mul_add] at p
      simp at p
      have q:= Nat.add_right_cancel p
      simp
      exact ih b q

theorem mulr2 : ∀ a b : Nat, 2*a=2*b → a=b := by
  sorry

theorem mul2iff : ∀ a b : Nat, a = b ↔ 2*a=2*b := by
  intro a b
  apply Iff.intro
  . exact rmul2 a b 
  . exact mulr2 a b

theorem muldiveq :∀ a : Nat, 2*a/2=a := by
  intro a
  induction a with
    |zero => 
      simp
    |succ n => 
      rw [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_comm]
      simp
      have q: 2≤ 2+2*n := by exact Nat.le_add_right 2 (2*n)
      rw [Nat.div_eq]
      simp [q]
      rw [Nat.add_sub_self_left]
      assumption 

def sumToN: (x:Nat) -> Nat 
  | 0 => 0
  | x+1 => x+1 + sumToN x

#eval sumToN 5
#eval 5*6/2

theorem sumToNopt: ∀n:Nat, 2*(sumToN n)=n*(n+1) := by
  intro n
  induction n with
  | zero => rfl
  | succ n ih => (
    rw [Nat.succ_eq_add_one]
    simp [sumToN]
    rw [Nat.mul_add, ih, Nat.mul_comm, Nat.mul_comm n, ← Nat.mul_add]
    apply mulKeepsEqL (2+n) (n+1+1) (n+1)
    rw [Nat.add_comm]
  )
