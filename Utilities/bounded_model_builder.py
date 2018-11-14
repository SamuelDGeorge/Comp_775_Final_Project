
import tensorflow as tf
import numpy as np
 
def parse_bounded_record(raw_record, is_training, num_points):
    """Parse an ImageNet record from `value`."""
    keys_to_features = {
        'image/encoded':
            tf.FixedLenFeature((), tf.string, default_value=''),
        'image/format':
            tf.FixedLenFeature((), tf.string, default_value='jpeg'),
        'image/class/label':
            tf.FixedLenFeature([num_points], dtype=tf.float32, default_value=np.zeros(num_points)),
        'image/filename':
            tf.FixedLenFeature([], dtype=tf.string, default_value='default.JPEG')
    }
 
    parsed = tf.parse_single_example(raw_record, keys_to_features)
    image = tf.image.decode_image(
        tf.reshape(parsed['image/encoded'], shape=[]),
        3)
 
    # Note that tf.image.convert_image_dtype scales the image data to [0, 1).
    image = tf.image.convert_image_dtype(image, dtype=tf.float32)
 
    image = tf.image.resize_image_with_crop_or_pad(image,331,331)
    
    label = tf.cast(
        tf.reshape(parsed['image/class/label'], shape=[8]),
        dtype=tf.float32)


    filename = tf.reshape(parsed['image/filename'], shape=[])
    
 
    return image, label, filename

def get_bounded_batch(is_training, filenames, batch_size, num_epochs=1, num_parallel_calls=1):
    dataset = tf.data.TFRecordDataset(filenames)
 
    if is_training:
        dataset = dataset.shuffle(buffer_size=1500)
 
    dataset = dataset.map(lambda value: parse_bounded_record(value, is_training),
                          num_parallel_calls=num_parallel_calls)
    dataset = dataset.shuffle(buffer_size=10000)
    dataset = dataset.batch(batch_size)
    dataset = dataset.repeat(num_epochs)
    iterator = dataset.make_one_shot_iterator()
 
    features, labels = iterator.get_next()
 
    return features, labels

def build_bounded_iterator(is_training, filenames, batch_size, num_epochs=1000, num_parallel_calls=12, num_points = 8):
    dataset = tf.data.TFRecordDataset(filenames)

    if is_training:
        dataset = dataset.shuffle(buffer_size=1500)

    dataset = dataset.map(lambda value: parse_bounded_record(value, is_training, num_points),
                            num_parallel_calls=num_parallel_calls)
    dataset = dataset.shuffle(buffer_size=10000)
    dataset = dataset.batch(batch_size)
    dataset = dataset.repeat(num_epochs)
    iterator = dataset.make_one_shot_iterator()
    return iterator
