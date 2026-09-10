<?php

namespace App\Controller;

use App\Repository\PinRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_ADMIN')]
final class AdminController extends AbstractController
{
    #[Route(path: '/admin/pins', name: 'app_admin_pins')]
    public function pins(PinRepository $repository): Response
    {
        return $this->render('admin/pins.html.twig', [
            'pins' => $repository->findAll()
        ]);
    }

    #[Route(path: '/admin/pins/{id}/delete', name: 'app_admin_pin_delete')]
    public function deletePin(int $id, PinRepository $repository, EntityManagerInterface $em): Response
    {
        $pin = $repository->find($id);
        if ($pin) {
            $em->remove($pin);
            $em->flush();
            $this->addFlash('error', 'The pin was deleted by admin !');
        }
        return $this->redirectToRoute('app_admin_pins');
    }

    #[Route(path: '/admin/users', name: 'app_admin_users')]
    public function users(UserRepository $repository): Response
    {
        return $this->render('admin/users.html.twig', [
            'users' => $repository->findAll()
        ]);
    }

    #[Route(path: '/admin/users/{id}/delete', name: 'app_admin_user_delete')]
    public function deleteUser(int $id, UserRepository $repository, EntityManagerInterface $em): Response
    {
        $user = $repository->find($id);
        if ($user) {
            $em->remove($user);
            $em->flush();
            $this->addFlash('error', 'The user was deleted by admin !');
        }
        return $this->redirectToRoute('app_admin_users');
    }
}
