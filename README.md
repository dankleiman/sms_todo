The other day, I had the pleasure of talking to someone who builds mobile apps with people in developing countries so that community health workers can deliver medical information and collect data.

As were talking about the technical challenges and logistical challenges (provisioning hundreds of mobile phones and numbers in one go in a country where you have no presence, e.g.), I have a pretty clear mental model of a basic CRUD app distilled down to Android...and then he said something that changed how I thought about the entire problem:

**Some of their programs are limited to SMS-only communication.** No smartphones, no apps, just text.

How do you go about guiding someone through a decision tree or collecting form submissions via SMS?

By coincidence, I had just started reading [a book about building command line apps](https://pragprog.com/book/dccar2/build-awesome-command-line-applications-in-ruby-2) and I think that's how the lightbulb went off for me.

As a developer, I spend a lot of time in front of a command prompt. Many of the more experienced devs I know wouldn't want to touch anything other than the command line to do the bulk of their work -- **and they are navigating an application interface largely built around entering a single text command at a time**, just like our SMS-constrained health workers.

In *Build Awesome Command-Line Applications in Ruby 2*, one of the first sample projects is a to do list app, from the command line.

Your basic set up allows you to add items to the list, retrieve the whole list, and mark items as complete. As I was building it out, I also wanted to delete things, because I found that more satisfying.

Once the idea of an interactive SMS app and the command line to do list fused in my head, I thought it would be fun to write a simple, somewhat interactive program that was all SMS-based.

[Learn more about how I built this app using Twilio](http://dankleiman.github.io/blog/2015/08/13/sms-to-do-list-with-twilio/) or keep browsing through this code.

Thanks!
