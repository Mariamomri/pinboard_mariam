<?php

namespace App\Controller;

use App\Entity\Pin;
use App\Entity\User;
use App\Form\PinType;
use App\Repository\PinRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class PinController extends AbstractController
{
    #[Route(path: '/pin', name: 'app_pin_index')]
    public function index(PinRepository $repository): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'You must login to view the pins !');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('pin/index.html.twig', [
            'pins' => $repository->findAll()
        ]);
    }

    #[Route(path: '/pin/create', name: 'app_pin_create')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'You must login to create a Pin !');
            return $this->redirectToRoute('app_login');
        }

        $pin = new Pin();
        $form = $this->createForm(PinType::class, $pin);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $pin->setUser($this->getUser());
            $em->persist($pin);
            $em->flush();
            $this->addFlash('success', 'The pin "' . $pin->getTitle() . '" was successfully created');
            return $this->redirectToRoute('app_pin_index');
        }

        return $this->render('pin/create.html.twig', [
            'pinForm' => $form
        ]);
    }

    #[Route(path: '/pin/{id}', name: 'app_pin_show', requirements: ['id' => '\d+'])]
    public function show(Pin $pin): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'You must login to view the pins !');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('pin/show.html.twig', [
            'pin' => $pin
        ]);
    }

    #[Route(path: '/pin/{id}/edit', name: 'app_pin_edit', requirements: ['id' => '\d+'])]
    public function edit(Pin $pin, Request $request, EntityManagerInterface $em): Response
    {
        /** @var User $user */
        $user = $this->getUser();
        if (!$user) {
            $this->addFlash('error', 'You must login to edit a Pin !');
            return $this->redirectToRoute('app_login');
        } elseif ($pin->getUser()->getEmail() !== $user->getEmail()) {
            $this->addFlash('error', 'You must be the owner to edit this pin');
            return $this->redirectToRoute('app_pin_index');
        }

        $form = $this->createForm(PinType::class, $pin);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'The pin was successfully modified !');
            return $this->redirectToRoute('app_pin_show', ['id' => $pin->getId()]);
        }

        return $this->render('pin/edit.html.twig', [
            'pin' => $pin,
            'pinForm' => $form
        ]);
    }

    #[Route(path: '/pin/{id}/delete', name: 'app_pin_delete', requirements: ['id' => '\d+'])]
    public function delete(Pin $pin, EntityManagerInterface $em): Response
    {
        /** @var User $user */
        $user = $this->getUser();
        if (!$user) {
            $this->addFlash('error', 'You must login to delete a Pin !');
            return $this->redirectToRoute('app_login');
        } elseif ($pin->getUser()->getEmail() !== $user->getEmail()) {
            $this->addFlash('error', 'You must be the owner to delete this pin');
            return $this->redirectToRoute('app_pin_index');
        }

        $titre = $pin->getTitle();
        $em->remove($pin);
        $em->flush();
        $this->addFlash('info', 'The pin "' . $titre . '" was successfully deleted !');
        return $this->redirectToRoute('app_pin_index');
    }
}
