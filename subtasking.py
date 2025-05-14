from pymonik import Pymonik, task

@task 
def add_one(a:int) -> int:
    return a + 1

@task
def add(a: int, b: int) -> int:
    if a <= 0:
        return b
    b_plus_one = add_one.invoke(b)
    return add.invoke(a-1, b_plus_one, delegate=True) 
