package main

import "testing"

func equalSlices(a, b []string) bool {
	if len(a) != len(b) {
		return false
	}
	for i := range a {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

func TestExpectedDaemons(t *testing.T) {
	m := map[string][]string{
		"common": {"a"},
		"PRSNL":  {"b", "c"},
	}
	if got := expectedDaemons(m, "PRSNL"); !equalSlices(got, []string{"a", "b", "c"}) {
		t.Errorf("expectedDaemons(PRSNL) = %v, want [a b c]", got)
	}
	if got := expectedDaemons(m, "UNKNOWN"); !equalSlices(got, []string{"a"}) {
		t.Errorf("expectedDaemons(UNKNOWN) = %v, want [a] (common only)", got)
	}
	if got := expectedDaemons(m, ""); !equalSlices(got, []string{"a"}) {
		t.Errorf("expectedDaemons(\"\") = %v, want [a] (common only)", got)
	}
}

func TestEvalDaemons(t *testing.T) {
	expected := []string{"x", "y", "z"}

	// All up → Pass.
	if r := evalDaemons(expected, func(string) bool { return true }, "running"); r.Status != Pass {
		t.Errorf("all up: status = %v, want Pass", r.Status)
	}

	// One down → Fail, with a detail naming exactly the down entry.
	down := map[string]bool{"y": true}
	r := evalDaemons(expected, func(n string) bool { return !down[n] }, "running")
	if r.Status != Fail {
		t.Errorf("one down: status = %v, want Fail", r.Status)
	}
	if len(r.Details) != 1 || r.Details[0] != "not running: y" {
		t.Errorf("one down: details = %v, want [not running: y]", r.Details)
	}

	// Empty expected list → Pass (nothing to verify).
	if r := evalDaemons(nil, func(string) bool { return false }, "running"); r.Status != Pass {
		t.Errorf("empty: status = %v, want Pass", r.Status)
	}
}
