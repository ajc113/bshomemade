class TrailerMailer < ApplicationMailer

  # Send notification to shop owners about a new inquiry
  def notify_shop(trailer)
    @trailer = trailer
    @greeting = "Hi"

    mail(to: "costa.aj@gmail.com, bsicecreamtruck@gmail.com",
      reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>',
      subject: 'Received new trailer inquiry',
    )
  end

  # Send acknowledgment to the customer
  def acknowledgment(trailer)
    @trailer = trailer
    @greeting = "Hi"

    mail(to: @trailer.email,
      reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>',
      subject: 'Thank you for your B\'s Ice Cream Truck inquiry',
    )
  end

  # Send pricing information to the customer (disabled in production)
  def pricing_info(trailer)
    return if Rails.env.production? # Disabled in production as requested

    @trailer = trailer
    @greeting = "Hi"
    
    attachments['bs_icecream_truck_pricing.pdf'] = File.read(Rails.root.join('app/assets/docs/bs_icecream_truck_pricing.pdf')) if File.exist?(Rails.root.join('app/assets/docs/bs_icecream_truck_pricing.pdf'))

    mail(to: @trailer.email,
      reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>',
      subject: 'B\'s Ice Cream Truck - Pricing Information',
    )
  end
end
