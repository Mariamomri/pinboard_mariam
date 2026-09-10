<?php

namespace App\DataFixtures;

use App\Entity\Pin;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    public function __construct(private UserPasswordHasherInterface $passwordHasher)
    {
    }

    public function load(ObjectManager $manager): void
    {
        $usersData = [
            ['firstname' => 'Alice', 'lastname' => 'Martin', 'email' => 'alice@pinboard.be'],
            ['firstname' => 'Bruno', 'lastname' => 'Dupont', 'email' => 'bruno@pinboard.be'],
            ['firstname' => 'Clara', 'lastname' => 'Lefevre', 'email' => 'clara@pinboard.be'],
        ];

        $users = [];
        foreach ($usersData as $data) {
            $user = new User();
            $user->setFirstname($data['firstname']);
            $user->setLastname($data['lastname']);
            $user->setEmail($data['email']);
            $user->setPassword($this->passwordHasher->hashPassword($user, 'password123'));
            $user->setIsVerified(true);
            $manager->persist($user);
            $users[] = $user;
        }

        $pinsData = [
            ['title' => 'Sunset over the mountains', 'description' => 'A beautiful sunset captured in the Alps.', 'imageName' => 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600'],
            ['title' => 'Minimalist workspace', 'description' => 'A clean and simple desk setup.', 'imageName' => 'https://images.unsplash.com/photo-1497215728101-856f4ea42174?w=600'],
            ['title' => 'Fresh pasta recipe', 'description' => 'Homemade pasta with tomato sauce.', 'imageName' => 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=600'],
            ['title' => 'Cozy reading corner', 'description' => 'A warm spot to enjoy a good book.', 'imageName' => 'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=600'],
            ['title' => 'City skyline at night', 'description' => 'Lights of the city after dark.', 'imageName' => 'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?w=600'],
            ['title' => 'Autumn forest path', 'description' => 'Walking through fallen leaves.', 'imageName' => 'https://images.unsplash.com/photo-1476820865390-c52aeebb9891?w=600'],
            ['title' => 'Modern living room', 'description' => 'Interior design inspiration.', 'imageName' => 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=600'],
            ['title' => 'Beach vacation vibes', 'description' => 'Crystal clear water and white sand.', 'imageName' => 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600'],
            ['title' => 'DIY plant shelf', 'description' => 'A simple project for plant lovers.', 'imageName' => 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600'],
            ['title' => 'Street style outfit', 'description' => 'Casual fashion inspiration.', 'imageName' => 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=600'],
            ['title' => 'Homemade latte art', 'description' => 'Practicing coffee art at home.', 'imageName' => 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=600'],
            ['title' => 'Hiking trail views', 'description' => 'The reward after a long climb.', 'imageName' => 'https://images.unsplash.com/photo-1551632811-561732d1e306?w=600'],
        ];

        foreach ($pinsData as $i => $data) {
            $pin = new Pin();
            $pin->setTitle($data['title']);
            $pin->setDescription($data['description']);
            $pin->setImageName($data['imageName']);
            $pin->setUser($users[$i % count($users)]);
            $manager->persist($pin);
        }

        $manager->flush();
    }
}
