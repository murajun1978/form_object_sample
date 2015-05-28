class TagsRegistrationValidator < ActiveModel::Validator
  def validate(record)
    unless is_uniq?(record)
      record.errors[:tags] << I18n.t('errors.messages.taken')
    end

    unless less_than_equal?(record, options[:maximum])
      record.errors[:tags] << I18n.t('errors.messages.less_than_or_equal_to', count: options[:maximum])
    end
  end

  private
  def is_uniq?(record)
    record.tags.size == record.tags.map(&:name).uniq.size
  end

  def less_than_equal?(record, maximum_size)
    record.tags.size.to_i <= maximum_size.to_i
  end
end
