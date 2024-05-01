import fire

def hello(name="poetry2nix"):
    return "Hello %s!" % name

def main():
    fire.Fire(hello)
