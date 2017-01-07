class Page < ApplicationRecord
  belongs_to :user

  has_attached_file :contact_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :contact_image, content_type: /\Aimage\/.*\z/

  has_attached_file :about_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :about_image, content_type: /\Aimage\/.*\z/

  has_settings do |s|
    s.key :theme, :defaults => { :layout => 'sky', color: 'blue', button_text: 'More About Me', header: 'couple' }
    s.key :name,  :defaults => { :first => 'FIRST', last: 'LAST', license: 'LPC, LISAC' }
    s.key :practice, :defaults => { :business_name => 'PRACTICE, LLC', :motto => 'The default company motto', address: '123 Main St.', city: 'Gilbert', state: 'AZ', zip: '85296'}
    s.key :contact,  :defaults => { title: 'Contact Us', :phone => '8885551212', address: '123 Main St.', city: 'Gilbert', state: 'AZ', zip: '85296', email: 'counselor@gmail.com', fax: '8775551212'}
    s.key :about, :defaults => { :title => 'About Me', :description => 'Default Description' }
    s.key :specialties, :defaults => { :comma_seperated_list => 'couples,divorce,addiction' }
    s.key :payment, :defaults => { :title => 'How we accept payments', types: 'all major credit cards, check, cash', insurance: 'aetna, blue cross, blue shield', note: 'note: copays must be payed before or at time of appointment.', rate: 'Fee for private pay is $125 per session' }
  end

  def layout
    settings(:theme).layout
  end

  def button_text
    settings(:theme).button_text
  end

  def full_name_with_license
    "#{first_name} #{last_name}, #{license}"
  end

  def payment_title
    settings(:payment).title
  end

  def payment_types
    settings(:payment).types.split(',')
  end

  def insurance_accepted
    settings(:payment).insurance.split(',')
  end

  def payment_note
    settings(:payment).note
  end

  def payment_rate
    settings(:payment).rate
  end

  def first_name
    settings(:name).first
  end

  def last_name
    settings(:name).last
  end

  def license
    settings(:name).license
  end

  def practice_name
    settings(:practice).business_name
  end

  def address
    settings(:practice).address
  end

  def city
    settings(:practice).city
  end

  def state
    settings(:practice).state
  end

  def zip
    settings(:practice).zip
  end

  def contact_address
    settings(:contact).address
  end

  def contact_city
    settings(:contact).city
  end

  def contact_state
    settings(:contact).state
  end

  def contact_zip
    settings(:contact).zip
  end


  def email
    settings(:contact).email
  end

  def phone
    settings(:contact).phone
  end

  def fax
    settings(:contact).fax
  end

  def city
    settings(:practice).city
  end

  def motto
    settings(:practice).motto
  end

  def contact_title
    settings(:contact).title
  end

  def about_title
    settings(:about).title
  end

  def about_desc
    settings(:about).description
  end

  def specialties
    settings(:specialties).comma_seperated_list.delete(' ').split(',')
  end

  def sky_navbar_color
    case settings(:theme).color
    when 'blue'
      '#e3f2fd'
    when 'pink'
      '#ffb3cc'
    when 'green'
      '#b3ffb3'
    when 'yellow'
      '#ffffb3'
    else
      '#000'
    end
  end

  def sky_jumbotron_color
    case settings(:theme).color
    when 'blue'
      '#ccebff'
    when 'pink'
      '#ff99bb'
    when 'green'
      '#4dff4d'
    when 'yellow'
      '#ffff66'
    else
      '#000'
    end
  end

  def sky_jumbotron_header
    case settings(:theme).header
    when 'blue'
      '#ccebff'
    when 'pink'
      '#ff99bb'
    when 'green'
      '#4dff4d'
    when 'yellow'
      '#ffff66'
    else
      '#000'
    end
  end

  def sky_button_color
    case settings(:theme).color
    when 'blue'
      '#00ace6'
    when 'pink'
      '#ff0055'
    when 'green'
      '#00b300'
    when 'yellow'
      '#b3b300'
    else
      '#000'
    end
  end

end