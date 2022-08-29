<?php

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class HomePageTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function testRootPageTest()
    {
        $response = $this->get('/');
        $name = env('APP_NAME');
        $response->assertStatus(200)->assertSee($name);
    }

    /** @test */
    public function the_static_pages_are_loaded_when_guest_clicks_menu_link()
    {
        $this->withoutExceptionHandling();

        $response = $this->get('/theartist');
        $response->assertStatus(200);
        $response->assertSee('The Artist');

        $response = $this->get('/atwork');
        $response->assertStatus(200);
        $response->assertSee('At Work');

        $response = $this->get('/contactme');
        $response->assertStatus(200);
        $response->assertSee('New Message');
    }
}
