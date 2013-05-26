"""Implementation of the abstract factory pattern"""

import random

class PetShop:
	"""A pet shop"""

	def __init__(self,animal_factory=None):
		"""pet_factory is our abstract factory. We can set it at will."""

		self.pet_factory = animal_factory

	def show_pet(sef):
		"""Creates and shows a pet suing the abstract factory"""

		pet = self.pet_factory.get_pet()
		print("This sis sa lovely",pet)
		print("it says",pet.speak())
		print("it eats",self.pet_factory.get_food())

#Stuff that our factory makes
class Dog:
	def speak(self):
		return "woof"

	def __str__(self):
		return "Dog"

class Cat:
	def speak(self):
		return "miao"

	def __str__(self):
		return "Cat"

#Factory classes
class DogFactory:
	def get_pet(self):
		return Dog()
	def get_food(self):
		return "dog food"

class CatFactory:
	def get_pet(self):
		return Cat()
	def get_food(self):
		return "cat food"

#Create the proper family

def get_factory():
	"""Let's be dynamic!"""
	return random.choice([DogFactory,CatFactory])()

#Show pets swith various factories
if __name__ == '__main__':
	shop = PetShop()
	for i in range(3):
		shop.pet_factory = get_factory()
		shop.show_pet()
		print("="*20)
