<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Queue\SerializesModels;

class FiokTorles extends Mailable
{
    use Queueable, SerializesModels;

    public $customer;
    public $id;
    /**
     * Create a new message instance.
     */
    public function __construct($customer, $id)
    {
        $this->customer = $customer;
        $this-> id = $id;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(

            from: new Address('xclsv.contact@gmail.com', 'XCLSV'),
            replyTo: 'xclsv.contact@gmail.com',
            subject: 'Fiók törlés',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.torles',
            with: [
                'customer' => $this->customer,
                'id' => $this->id,
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

