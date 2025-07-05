<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Queue\SerializesModels;

class JelszoMegadas extends Mailable
{
    use Queueable, SerializesModels;

    public $customer;
    public $verificationToken;

    /**
     * Create a new message instance.
     */
    public function __construct($customer, $verificationToken)
    {
        $this->customer = $customer;
        $this->verificationToken = $verificationToken;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(

            from: new Address('xclsv.contact@gmail.com', 'XCLSV'),
            replyTo: 'xclsv.contact@gmail.com',
            subject: 'Email hitelesítés és Jelszó Megadás',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.jelszo',
            with: [
                'customer' => $this->customer,
                'verificationToken' => $this->verificationToken
            ],

        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
