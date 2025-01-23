package test

import "core:fmt"
import "core:strings"
import "core:time"
import "core:unicode"

count_letters :: proc(s: string) -> map[rune]int {
	counts := make(map[rune]int)
	for c in s {
		if unicode.is_alpha(c) {
			lowercase_c := unicode.to_lower(c)
			counts[lowercase_c] += 1
		}
	}
	return counts
}

main :: proc() {
	// input := "This is a really long string for no reason, thanks, bye!"
	input := "Hello, world"
	iterations := 1000
	total_duration := time.Duration(0)

	for _ in 0 ..< iterations {
		start := time.now()
		count_letters(input)
		total_duration += time.since(start)
	}

	fmt.println("Average time per run:", int(total_duration) / iterations, "ns")

	fmt.println(count_letters(input))
}

// Average time per run: 766 ns (with -o:speed)
// map[r=1, d=1, e=1, w=1, h=1, l=3, o=2]

// Average time per run: 2067 ns (with -o:speed)
// map[o=4, k=1, i=3, g=2, e=3, t=3, r=4, a=4, n=5, l=3, y=2, h=2, f=1, s=5, b=1]
