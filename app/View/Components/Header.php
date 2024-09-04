<?php

namespace App\View\Components;

use Illuminate\View\View;
use Illuminate\View\Component;

class Header extends Component
{
   public function __construct(
      public string $title,
      public string $backButton="false",
  ) {}
    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render(): View
    {
        return view('components.header');
    }
}
