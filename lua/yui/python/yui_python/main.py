import sys
import tiktoken

def num_tokens_from_string(string: str, model_name: str) -> int:
    """Returns the number of tokens in a text string."""
    encoding = tiktoken.encoding_for_model(model_name)
    num_tokens = len(encoding.encode(string))
    return num_tokens

if __name__ == "__main__":
    # Read text from stdin
    text = sys.stdin.read()

    # Count tokens
    token_count = num_tokens_from_string(text, "gpt-3.5-turbo-16k")

    # Print the token count to stdout
    print(token_count)

