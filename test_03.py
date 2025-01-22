def countLetters(s: str) -> dict[str, int]:
    _s = s.lower()
    _s = remove_whitespace(_s)
    local_dict = dict()

    for val in _s:
        if val.isalpha():
            if val not in local_dict:
                local_dict[val] = 1
            else:
                local_dict[val] += 1

    return local_dict


def remove_whitespace(s: str) -> str:
    res = ""
    local_array = ["\n", "\t", "\r", "\f", "\v", "\b", " "]
    for val in s:
        if val not in local_array:
            res += val

    return res


def main() -> None:
    print(countLetters("Hello, World!"))


if __name__ == '__main__':
    main()

# countLetters('Hello, World!') => { 'h': 1, 'e': 1, 'l': 3, 'o': 2, 'w': 1, 'r': 1, 'd': 1 }
