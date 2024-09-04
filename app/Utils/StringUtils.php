<?php

namespace App\Utils;
use Illuminate\Support\Str;
use DOMDocument;

class StringUtils
{
    public static function removeWord($source, $stringToRemove)
    {
        // Find the position of the class attribute in the HTML string
        $classPos = strpos($source, 'class="');
        if ($classPos !== false) {
            // Find the position of the class to remove within the class attribute
            $classToRemovePos = strpos($source, $stringToRemove, $classPos);
            if ($classToRemovePos !== false) {
                // Remove the class and update the HTML string
                $html = substr_replace($source, '', $classToRemovePos, strlen($stringToRemove));
                // Remove any extra spaces or trailing quotes after removal
                $html = str_replace('  ', ' ', $html);
                $html = str_replace(' "', '"', $html);
            }
        }

        return $html;
    }

    public static function getContentTable($content)
    {

        // Create a new DOMDocument
        $dom = new DOMDocument();
        $dom->loadHTML($content);

        // Get the <table> element
        $tableElement = $dom->getElementsByTagName('table')->item(0);

        if ($tableElement) {
            // Remove attributes from the <table> element
            while ($tableElement->attributes->length > 0) {
                $tableElement->removeAttribute($tableElement->attributes->item(0)->name);
            }

            // Get the <tbody> element
            $tbodyElement = $tableElement->getElementsByTagName('tbody')->item(0);

            if ($tbodyElement) {
                // Remove attributes from the <tbody> element
                while ($tbodyElement->attributes->length > 0) {
                    $tbodyElement->removeAttribute($tbodyElement->attributes->item(0)->name);
                }

                // Get the inner HTML of the <tbody> element
                $tbodyContent = '';
                foreach ($tbodyElement->childNodes as $childNode) {
                    $tbodyContent .= $dom->saveHTML($childNode);
                }

                // Replace the original HTML with the cleaned content
                $newHtml = $tbodyContent;

                return $newHtml;
            }
        }
    }

    public static function limitTextWithReadMore($text, $limit, $readMoreLink)
    {
        if (strlen($text) <= $limit) {
            return $text;
        }
        $shortenedText = substr($text, 0, $limit);

        return $shortenedText.'...';
    }

   public static function createSlug($title) {
      // Convert the title to lowercase
      $slug = Str::lower($title);
      
      // Replace spaces with hyphens
      $slug = Str::slug($slug, '-');
  
      // Optionally, you can remove any special characters
      $slug = preg_replace('/[^A-Za-z0-9\-]/', '', $slug);
  
      return $slug;
  }

}
