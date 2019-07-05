//
//  PTableViewCell.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/5.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "PTableViewCell.h"
@interface PTableViewCell()

@end
@implementation PTableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"reuseIdentifiervvd";
    PTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell){
        cell=[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.imageV.frame=CGRectMake(10, 10, 50, 50);
    self.titleLabel.frame=CGRectMake(CGRectGetMaxX(self.imageV.frame)+10, 10, [UIScreen mainScreen].bounds.size.width-CGRectGetMaxX(self.imageV.frame)-10-10, 15);
    self.contentLabel.frame=CGRectMake(CGRectGetMaxX(self.imageV.frame)+10, CGRectGetMaxY(self.titleLabel.frame), [UIScreen mainScreen].bounds.size.width-CGRectGetMaxX(self.imageV.frame)-10-10, 35);
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
}

-(void)setModel:(PModel *)model{
    _model=model;
    if(![model.title isKindOfClass:[NSNull class]]){
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@"amountSource"]];
        self.titleLabel.text=model.title;
        self.contentLabel.text=[NSString stringWithFormat:@"%@..\n@%@   %@",model.digest,model.source,model.ptime];
    }
}

-(UIImageView *)imageV{
    if(_imageV==nil){
        _imageV=[[UIImageView alloc] init];
    }
    return _imageV;
}
-(UILabel *)titleLabel{
    if(_titleLabel==nil){
        _titleLabel=[[UILabel alloc] init];
        _titleLabel.font=[UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if(_contentLabel==nil){
        _contentLabel=[[UILabel alloc] init];
        _contentLabel.font=[UIFont systemFontOfSize:10];
        _contentLabel.numberOfLines=0;
    }
    return _contentLabel;
}



-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}
@end
