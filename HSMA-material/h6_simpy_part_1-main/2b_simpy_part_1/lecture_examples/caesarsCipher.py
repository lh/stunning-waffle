import unittest
import string


# seems to be the place to put actual code
def encrypt(message):
    abc = string.ascii_letters + string.digits + string.punctuation + " "
    encrypted_message = "".join(
        [
            abc[abc.find(char) + 1] if len(abc) > (abc.find(char) + 1) else abc[0]
            for idx, char in enumerate(message)
        ]
    )
    return encrypted_message


# unit testing


class TestEncryption(unittest.TestCase):

    # setUp goes here

    def setUp(self):

        self.my_message = "I am Batman!!! ***888"

    # tests go here

    def test_inputExists(self):
        self.assertIsNotNone(self.my_message)

    def test_inputType(self):
        self.assertIsInstance(self.my_message, str)

    def test_functionReturnsSomething(self):
        self.assertIsNotNone(encrypt(self.my_message))

    def test_lenIO(self):
        self.assertEqual(len(self.my_message), len(encrypt(self.my_message)))

    def test_differentIO(self):
        self.assertNotIn(self.my_message, encrypt(self.my_message))

    def test_outputType(self):
        self.assertIsInstance(encrypt(self.my_message), str)

    def test_shiftedCipher(self):
        abc = string.ascii_letters + string.digits + string.punctuation + " "
        encrypted_message = "".join(
            [
                abc[abc.find(char) + 1] if len(abc) > (abc.find(char) + 1) else abc[0]
                for idx, char in enumerate(self.my_message)
            ]
        )
        print(encrypted_message)
        self.assertEqual(encrypted_message, encrypt(self.my_message))


if __name__ == "__main__":
    unittest.main()
