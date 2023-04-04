<?php

namespace Tests\Feature;

use App\Models\Message;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Livewire\Livewire;
use Tests\TestCase;

class ManageMessageTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function a_guest_can_create_a_message()
    {
        $response = $this->get('/contactme')
            ->assertStatus(200)
            ->assertSee('Message');
    }

    /** @test */
    public function a_message_is_added_to_the_database()
    {
        Livewire::test('messages.contact-me')
                ->set('name', 'Peter Pike')
                ->set('email', 'pikepeter@gmail.com')
                ->set('subject', 'this is the subject field')
                ->set('content', 'this is the content of the message')
                ->set('my_question', env('KEY_WORD'))
                ->call('save');

        $this->assertDatabaseHas('messages', ['name' => 'Peter Pike']);
    }

    /** @test */
    public function a_guest_can_not_view_the_message_index()
    {
        $message = Message::factory()->create();
        $response = $this->get('/message');
        $response->assertRedirect('/login');
    }

    /** @test */
    public function a_signed_in_user_can_view_messages()
    {
        $this->signIn();
        $message = Message::factory()->create();
        $response = $this->get('/message');
        $response->assertStatus(200);
    }
}
