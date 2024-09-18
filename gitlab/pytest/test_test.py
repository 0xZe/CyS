import pytest

# In your test_demo.py file

def login(password):
    # Simulate a login function that accepts a password
    # Here you can implement the logic to authenticate the user
    if password == 'strong-test-pass':
        return True
    else:
        return False

# Instead of test_password, consider using a name like password_fixture
@pytest.fixture
def password_fixture():
    return 'strong-test-pass'


# Ensure that you have test functions using the fixture
def test_login_with_correct_password(password_fixture):
    # Assuming a login function that accepts a password
    assert login(password_fixture) == True



# import pytest
# from myapp.utils import is_strong_password

# # Test cases for the password strength function
# @pytest.mark.parametrize("password,expected", [
#     ("short", False),
#     ("weakpassword", False),
#     ("WEAKpassword", False),
#     ("Strong1Password", True),
#     ("12345678", False),
# ])
# def test_is_strong_password(password, expected):
#     assert is_strong_password(password) == expected

 #   

