# Vim Python Folding

This is a vim plugin that makes better folds than using `foldmethod=indent`.

[Installation](#installation)

[Examples](#examples)

## Installation

I only know how to use `vim-plug`. But there are lots of good resources for using various Vim plugin managers. Vim 8 also has native package support.

### vim-plug

```vimrc
Plug 'samuelstevens/vim-plug'
```

## Examples

For example, here is a Python function with arguments over multiple lines.

```python
def _filter_fields_in_table(
    fields: Sequence[str],
    differing: Set[str],
    hide: Set[str],
    only: Set[str],
    show: Set[str],
) -> List[str]:
    good_fields = []

    for field in fields:
        if field in hide:
            continue

    return good_fields
```

With the oft-suggested `foldmethod=indent`, this becomes:

```python
def _filter_fields_in_table(
+--  5 lines: fields: Sequence[str],------------
) -> List[str]:
+-- 6 lines: good_fields = []-------------------
```

This plugin turns the above function into:

```python
+-- 24 lines: def _filter_fields_in_table(-------
```

Some more examples.

```python 
# original code
def __str__(self) -> str:
    return tabulate(self.rows, headers=self.headers)

# foldmethod=indent doens't even fold this.
def __str__(self) -> str:
    return tabulate(self.rows, headers=self.headers)

# plugin
+--  2 lines: def __str__(self) -> str:--------
```
