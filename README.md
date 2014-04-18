
# Weather::Icons::Rails [![Gem Version](https://badge.fury.io/rb/weather-icons-rails@2x.svg)](http://rubygems.org/gems/weather-icons-rails) [![Build Status](https://travis-ci.org/CodySchaaf/weather-icons-rails.svg?branch=master)](https://travis-ci.org/CodySchaaf/weather-icons-rails)
Weather-Icons-Rails gem for use in Ruby projects

## A free, open source font of Weather icons

Weather Icons is a font of 92 weather themed icons, ready to be dropped right into [Bootstrap](http://www.getbootstrap.com) or any other project.

Inspired by [Font Awesome](http://fontawesome.io/), They work in essentially the same way. They are infinitely scalable and any CSS that can be applied to text can be applied to them. All you need to do to insert an icon is add the class to an "i" element like this: `<i class="wi wi-day-lightning"></i>`

####[View demo and full icon reference](http://erikflowers.github.io/weather-icons/)

## Getting Started

The original author Erik put these web fonts together, I have packaged his hard work into a simple Sass based gem.

To install simply add

```ruby
gem 'weather-icons-rails'
```
then after bundeling add

```css
*= require weather-icons
```

right before `*= require_self`

###### Now it's time to have at it, and class up your HTML.

To add icons anywhere in your html just add one of these tags with your symbole of choice:

```html
<i class="wi wi-day-lightning"></i>
```
## If that wasn't easy enough, Helpers make it even easier!

In your view just add these to your HAML or ERB:
```ruby
wi_icon('day-lightning')
# => <i class="wi wi-day-lightning"></i>
```
```ruby
wi_icon('day-lightning', '', class: 'strong')
# => <i class="wi wi-day-lightning strong"></i>
# Although this currently does not change the actual look of the font yet. Any suggestions?
```
```ruby
wi_icon "day-lightning lg", class: "text-muted pull-left"
# => <i class="wi wi-day-lightning wi-lg text-muted pull-left"></i>
```
```ruby
wi_icon('day-lightning', 'Weather Icons', id: 'lightning', class: 'strong')
# => <i id="lightning" class="wi wi-day-lightning strong"></i> Weather Icons
```

```ruby
content_tag(:li, wi_icon("day-lightning li", text: "Bulleted list item"))
# => <li><i class="wi wi-day-lightning wi-li"></i> Bulleted list item</li>
```
```ruby
wi_stacked_icon "day-lightning", base: "day-cloudy-gusts"
# => <span class="fa-stack">
# =>   <i class="wi wi-day-cloudy-gusts wi-stack-2x"></i>
# =>   <i class="wi wi-day-lightning wi-stack-1x"></i>
# => </span>

wi_stacked_icon "day-lightning inverse", base: 'day-cloudy-gusts', class: "pull-right", text: "Hi!"
# => <span class="wi-stack pull-right">
# =>   <i class="wi wi-day-cloudy-gusts wi-stack-2x"></i>
# =>   <i class="wi wi-day-lightning wi-inverse wi-stack-1x"></i>
# => </span> Hi!
```

##Fancy css classes for fancy people.

Supported classes:

```css
  .wi-spin

  .wi-rotate-90
  .wi-rotate-180
  .wi-rotate-270

  .wi-flip-horizontal
  .wi-flip-vertical  

  .wi-ul
  .wi-li

  .wi-md
  .wi-lg
  .wi-xl
  .wi-2x
  .wi-3x
  ...
  .wi-9x

  .wi-fw // Fixed Width Icons

  .wi-border
```

## Version 0.0.3.1 (BETA?)
This is my first attempt at making a gem, please feel free to send me any pull requests or questions. I'm happy to help and or learn. Thanks!

The icon designs are originally by [Lukas Bischoff](http://www.twitter.com/artill). The font has been modified slightly for icon-font usage, which was then turned into a HTML/CSS/LESS addon by [Erik Flowers](http://www.helloerik.com). My gem was originally based off of the hard work over at [Font Awesome Rails](https://github.com/bokmann/font-awesome-rails) and then updated to closely mirror the Sass based version at [Font Awesome Sass](https://github.com/FortAwesome/font-awesome-sass).

### Collaboration
Any additional icon ideas, icon art, or other fixes/changes to how the package works are more than welcome.

## Credit
None of this would be possible without [Bootstrap](http://www.getbootstrap.com), [Font Awesome](http://fontawesome.io/), [Lukas Bischoff](http://www.twitter.com/artill), and [Erik Flowers](http://www.helloerik.com). I just put it into a gem and added the helpers, and extra styling css classes from font-awesome-sass. Cheatsheet provided by Michael Woywod.

Weather Icons licensed under [SIL OFL 1.1](http://scripts.sil.org/OFL) &mdash; Code licensed under [MIT License](http://opensource.org/licenses/mit-license.html)  &mdash; Documentation licensed under [CC BY 3.0](http://creativecommons.org/licenses/by/3.0)

## Contact
Weather Icons Rails is maintained by me, Cody Schaaf. Reach me at [@TheCodingCody](http://www.twitter.com/TheCodingCody) or through [GitHub](https://github.com/CodySchaaf/weather-icons-rails).

* The Weather Icons font is
  licensed under the [SIL Open Font License](http://scripts.sil.org/OFL).
* Weather Icons CSS files are
  licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
* The remainder of the weather-icons-rails project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
